class SurveysController < ApplicationController

  before_filter :find_user, only: [:index, :create]

  def index
    #Need to check how the customer will enter the page
    # 1.- the merchant is already log in and let the user use an ipad ipad or something
    # 2.- open url accesible by anyone using something merchant unique (merchant_name, uid, etc.)
    @questions = @user.questions.roots
  end

  def create
    session[:survey] ? find_survey : create_survey

    answers = @survey.add_answers params[:answers]
    question_id_array = answers.map{ |answer| answer.question_id if !answer.response && !answer.question.leaf? }.compact

    render render_page(question_id_array)
  end

  private

  def find_survey
    @survey = Survey.find id: session[:survey_id]
  end

  def create_survey
    @survey = Survey.create({ user_id: @user.id })
    session[:survey_id] = @survey.id
  end  

  def render_page question_id_array
    if question_id_array.empty?
      'success'
    else
      @questions = question_id_array.map{|id| Question.find_by_id(id).children }.flatten
      'index'
    end
  end

  def find_user
    @user = User.find_by name: params[:user_name]
  end
end
