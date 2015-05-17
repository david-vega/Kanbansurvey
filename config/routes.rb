Rails.application.routes.draw do
  devise_for :users

  get ':user_name/survey', to: 'surveys#index'
  post ':user_name/survey', to: 'surveys#create'
  post ':user_name/comment', to: 'surveys#comment_and_contact_info'

  root 'survey#index'
end
