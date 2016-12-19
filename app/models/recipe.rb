class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :user, presence: true

  def to_s
    name
  end
end
