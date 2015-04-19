# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = FactoryGirl.create :user, email: 'admin@realdeminas.com'

questions = %w{ question1 question2 question3 question4 question5 question6 question7 question8 question9
question10  }

first_child_questions = %w{ child_question_1 child_question_2 child_question_3 child_question_4 child_question_5 }

second_child_questions = %w{ second_child_question_1 second_child_question_2 second_child_question_3 second_child_question_4 second_child_question_5 }


questions.each do |question|
	question_record = FactoryGirl.create :question, user: user, content: question
end

questions = Question.roots

first_child_questions.each do |child_question|
	child_record = FactoryGirl.create :question, user: user, content: child_question
	child_record.move_to_child_of(questions.sample)
end

child_questions  =  Question.where depth: 1

second_child_questions.each do |child_question|
	child_record = FactoryGirl.create :question, user: user, content: child_question
	child_record.move_to_child_of(child_questions.sample)
end



