class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :contact

  before_create :add_external_id

  def add_answers answers
    ans = []

    answers.each do |key, value|
      ans << Answer.create({ response: value,
                           question_id: key,
                           survey_id: self.id })
    end
    ans
  end

  private

  def add_external_id
    self.external_id = SecureRandom.hex[0,20].upcase
  end
end
