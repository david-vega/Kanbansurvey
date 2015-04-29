class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :contact
  validates :user_id, presence: true

  before_create :add_external_id, :max_total_score

  MULTIPLIER = 1.0

  def add_answers answers
    ans = []

    answers.each do |key, value|
      ans << Answer.create({ response: value,
                             question_id: key,
                             survey_id: self.id })
    end
    ans
  end

  def set_final_score
    negative_score = self.answers.where(response: false).map{ |a| question_score(a.question.rank, a.question.depth) }.sum
    self.total_score = self.total_score - negative_score
    self.save
  end

  private

  def add_external_id
    self.external_id = SecureRandom.hex[0,20].upcase
  end

  def max_total_score
    questions = Question.where(user_id: user_id)
    self.total_score = questions.map{|q| question_score(q.rank, q.depth)}.sum
  end

  def question_score rank, depth
    rank/((depth + 1.0) * MULTIPLIER)
  end
end
