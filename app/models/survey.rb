class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :contact
  validates :user_id, presence: true

  before_create :add_external_id, :max_total_score

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

  def max_total_score
    questions = Question.where(user_id: user_id)
    self.total_score = questions.map{|q| q.rank/(q.depth+1.0)}.sum
  end
end
