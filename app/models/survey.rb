class Survey < ActiveRecord::Base
  belongs_to :user

  before_create :add_external_id

  private

  def add_external_id
    self.external_id = SecureRandom.hex[0,20].upcase
  end
end
