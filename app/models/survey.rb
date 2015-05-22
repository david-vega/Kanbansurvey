class Survey < ActiveRecord::Base
  include AASM
  belongs_to :user
  has_many :answers
  has_one :contact
  validates :user_id, presence: true
  serialize :total_score

  before_create :add_external_id, :max_total_score

  MULTIPLIER = 1.0

  aasm column: :state do
    state :initialized, :initial => true
    state :in_progress
    state :finalized

    event :in_progress do
      transitions from: :initialized, to: :in_progress
    end

    event :finalize do
      transitions from: :in_progress, to: :finalized,
      on_transition: :set_final_score
    end
  end

  def add_answers answers
    self.in_progress! unless self.in_progress?
    ans = []

    answers.each do |key, value|
      answer = Answer.create({ response: value,
                             question_id: key,
                             survey_id: self.id })
      ans << answer
      set_current_score answer unless answer.response
    end
    self.save
    ans
  end

  def set_final_score
    self.total_score[:final] = self.total_score[:current]/self.total_score[:max]
  end

  def add_comment comment
    self.comment = comment
    self.save!
  end

  private

  def set_current_score answer
    question = answer.question
    self.total_score[:current] -= question_score(question.rank, question.depth)
    self.save
  end


  def add_external_id
    self.external_id = SecureRandom.hex[0,20].upcase
  end

  def max_total_score
    questions = Question.where(user_id: user_id)
    max_score = questions.map{|q| question_score(q.rank, q.depth)}.sum  

    self.total_score = { max: max_score, final: 1, current: max_score }
  end

  def question_score rank, depth
    rank/((depth + 1.0) * MULTIPLIER)
  end
end
