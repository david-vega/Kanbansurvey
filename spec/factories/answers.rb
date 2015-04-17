FactoryGirl.define do
  factory :answer do
    sequence(:comment) { |n| "Some super interesting comment #{n}" }
    response { [true, false].sample }

    association :question
    association :surveys
  end
end
