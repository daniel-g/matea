FactoryGirl.define do
  factory :user do
    email { Faker::Internet.unique.email }
    name { Faker::Name.name }
  end
end
