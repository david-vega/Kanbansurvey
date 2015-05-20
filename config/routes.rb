Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
    delete '/logout', to: 'devise/sessions#destroy'
  end

  get ':user_name/survey', to: 'surveys#index'
  post ':user_name/survey', to: 'surveys#create'
  post ':user_name/comment', to: 'surveys#comment_and_contact_info'

  resources :dashboard, only: [:index, :show]

  root 'survey#index'
end
