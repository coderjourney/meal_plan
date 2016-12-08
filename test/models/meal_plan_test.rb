require "test_helper"

describe MealPlan do
  describe "validity" do
    let(:meal_plan) { MealPlan.new }

    before do
      meal_plan.valid?
    end

    it "requires a start date" do
      meal_plan.errors[:start_date].must_include "can't be blank"
    end

    it "requires an end date" do
      meal_plan.errors[:end_date].must_include "can't be blank"
    end

    it "requires a user" do
      meal_plan.errors[:user].must_include "can't be blank"
    end
  end

  describe "generating a weekly plan" do
    let(:meal_plan) { build(:meal_plan) }

    before do
      7.times do
        create(:recipe, user: meal_plan.user)
      end
    end

    it "populates a meal for each day between the start date and the end date" do
      meal_plan.meals.size.must_equal 0

      meal_plan.build_meals

      meal_plan.meals.size.must_equal 7
    end

    it "builds valid meals" do
      meal_plan.build_meals

      meal_plan.meals.all?(&:valid?).must_equal true
    end

    describe "with more days than recipes" do
      let(:meal_plan) { build(:meal_plan, end_date: 8.days.from_now) }

      it "build valid meals" do
        meal_plan.build_meals

        meal_plan.meals.all?(&:valid?).must_equal true
      end

      it "reuses recipes where necessary" do
        meal_plan.build_meals

        uniq_ids = meal_plan.meals.map(&:recipe_id).uniq
        uniq_ids.size.must_equal 7
      end
    end
  end
end
