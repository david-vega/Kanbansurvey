class Question < ActiveRecord::Base
  acts_as_nested_set

  belongs_to :user
  has_many :answers
end
