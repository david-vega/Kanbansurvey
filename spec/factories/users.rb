FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:name) { |n| "user#{n}" }
    password 'qwerty123'
  end
end
