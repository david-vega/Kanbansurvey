class Contact < ActiveRecord::Base
  belongs_to :survey
  validates :email, format: { with: /.+@.+\..+/i, message: "Invalid email ID" }, allow_nil: true
  validates :phone_number, format: { with: /\d{10}/, message: "bad format" }, allow_nil: true
  validates :survey_id, presence: true
end
