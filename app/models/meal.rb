class Meal < ApplicationRecord
  belongs_to :meal_plan, inverse_of: :meals
  belongs_to :recipe
end
