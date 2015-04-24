class SurveysController < ApplicationController
  def index
    #Need to check how the customer will enter the page
    # 1.- the merchant is already log in and let the user use an ipad ipad or something
    # 2.- open url accesible by anyone using something merchant unique (merchant_name, uid, etc.)
    @questions = User.last.questions.roots
  end

  def create
    survey = Survey.create({ user_id: User.last.id })

    answers = survey.add_answers params[:answers]
    question_id_array = answers.map{ |answer| answer.question_id if !answer.response && !answer.question.leaf? }.compact

    render render_page(question_id_array)
  end

  private

  def render_page question_id_array
    if question_id_array.empty?
      'success'
    else
      @questions = question_id_array.map{|id| Question.find_by_id(id).children }.flatten
      'index'
    end
  end
end
