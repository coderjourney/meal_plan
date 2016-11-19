FactoryGirl.define do
  factory :recipe do
    name { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
    association(:user)
  end
end
