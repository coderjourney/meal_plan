class User < ApplicationRecord
  include Clearance::User

  has_many :recipes
  has_many :meal_plans

  def recipe_options
    recipes.map do |recipe|
      [recipe.name, recipe.id]
    end
  end
end
