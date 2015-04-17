class Question < ActiveRecord::Base
  acts_as_nested_set

  #TODO add external_id to questions
  belongs_to :user
  has_many :answers
end
