FactoryGirl.define do
  factory :song do
    contributor factory: :user
    title { Faker::Book.title }
    author { Faker::Book.author }
  end
end
