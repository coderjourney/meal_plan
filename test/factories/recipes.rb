FactoryGirl.define do
  factory :recipe do
    name "Mom's Spaghetti"
    description "The best pasta in the world."
    association(:user)
  end
end
