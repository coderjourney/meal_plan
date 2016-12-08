class Meal < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :recipe
end
