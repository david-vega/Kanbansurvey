Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :dashboard, only: [:index, :show]
  
  get ':user_name/', to: 'surveys#index'
  post ':user_name/', to: 'surveys#create'
  post ':user_name/comment', to: 'surveys#comment_and_contact_info'

  
  root to: 'home#index'
end