FactoryGirl.define do
  factory :question do
    sequence(:content) { |n| " Some super interesting question #{n}" }
    sequence(:content) { |n| " Category#{n}" }
    level rand(10)

    association :user
  end

  factory :main_question, class: MainQuestion, parent: :question do
    type 'MainQuestion'
  end

  factory :sub_question, class: SubQuestion, parent: :question do
    type 'SubQuestion'
    association :main_question
  end
end
