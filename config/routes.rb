Rails.application.routes.draw do
  devise_for :users

  get ':user_name/survey', to: 'surveys#index'
  post ':user_name/survey', to: 'surveys#create'

  root 'survey#index'
end
