FactoryGirl.define do
  factory :contact do
    name 'John Doe'
    sequence(:phone_number) { |n| "456456456#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }

    association :survey
  end
end
