class Answer < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question
  validates :response, inclusion: {:in => [true, false]}
  validates :question_id, :survey_id, :response, presence: true
end
