FactoryGirl.define do
  factory :contact do
    name 'John Doe'
    sequence(:phone_number) { |n| "456356456#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }

    association :surveys
  end
end
