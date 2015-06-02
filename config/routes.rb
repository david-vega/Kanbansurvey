Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'devise/registrations#new'
    delete '/logout', to: 'devise/sessions#destroy'
  end

  get ':user_name/', to: 'surveys#index'
  post ':user_name/', to: 'surveys#create'
  post ':user_name/comment', to: 'surveys#comment_and_contact_info'

  resources :dashboard, only: [:index, :show]

  root 'devise/registrations#new'
end
