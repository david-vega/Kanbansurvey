class SurveysController < ApplicationController

  before_filter :find_user, only: [:index, :create]

  def index
    render render_page
  end

  def create
    create_survey unless @survey
    answers = @survey.add_answers params[:answers]
    session[:questions_id_array] = question_id_array(answers)

    render render_page
  end

  def submit
  end

  private

  def find_survey
    @survey = Survey.find_by id: session[:survey_id]
  end

  def find_user
    @user = User.find_by name: params[:user_name]
  end

  def create_survey
    @survey = Survey.create({ user_id: @user.id })
    session[:survey_id] = @survey.id
  end  

  def render_page
    #TODO move this to a presenter
    if @survey && @survey.finalized?
      'final_information'
    else
       get_questions
      'index'
    end
  end

  def get_questions
    #TODO  move this to a presenter
    @questions =
      if @survey && session[:questions_id_array].any?
        session[:questions_id_array].map{|id| @user.questions.find_by_id(id).children }.flatten
      else
        @user.questions.roots
      end
  end

  def question_id_array answers
    #TODO  move this to a presenter
    question_id_array = answers.map{ |answer| answer.question_id if !answer.response && !answer.question.leaf? }.compact
    @survey.finalize! if question_id_array.empty?

    question_id_array
  end
end
