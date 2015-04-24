Rails.application.routes.draw do
  devise_for :users

  get ':user_name/surveys', to: 'surveys#index'
  post ':user_name/surveys', to: 'surveys#create'

  root 'surveys#index'
end
