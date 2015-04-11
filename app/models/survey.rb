class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :contact

  before_create :add_external_id

  private

  def add_external_id
    self.external_id = SecureRandom.hex[0,20].upcase
  end
end
