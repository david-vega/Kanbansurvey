class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :find_survey, only: [:show]

	def index
		@survey =  current_user.surveys
	end	

	def show
		
	end

	private

	def find_survey
		@survey = current_user.surveys.find_by external_id: params[:id]
	end
end
