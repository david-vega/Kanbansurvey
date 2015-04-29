class SurveysController < ApplicationController

  before_filter :find_user, only: [:index, :create]

  def index
    if @survey && session[:questions_id_array]
      render render_page(session[:questions_id_array])
    else
      @questions = @user.questions.roots 
    end
  end

  def create
    create_survey unless @survey

    answers = @survey.add_answers params[:answers]

    render render_page(question_id_array(answers))
  end

  private

  def find_survey
    @survey = Survey.find_by id: session[:survey_id]
  end

  def create_survey
    @survey = Survey.create({ user_id: @user.id })
    session[:survey_id] = @survey.id
  end  

  def render_page question_id_array
    if question_id_array.empty?
      @survey.set_final_score
      'success'
    else
      @questions = question_id_array.map{|id| Question.find_by_id(id).children }.flatten
      'index'
    end
  end

  def find_user
    @user = User.find_by name: params[:user_name]
  end

  def question_id_array answers
    question_id_array = answers.map{ |answer| answer.question_id if !answer.response && !answer.question.leaf? }.compact
    session[:questions_id_array] = question_id_array

    question_id_array
  end
end
