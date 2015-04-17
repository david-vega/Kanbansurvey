FactoryGirl.define do
  factory :question do
    sequence(:content) { |n| "Some super interesting question #{n}" }
    sequence(:category) { |n| "Category#{n}" }
    rank { rand(1..10) }

    association :user
  end
end
