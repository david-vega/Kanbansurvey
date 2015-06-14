Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  get ':user_name/', to: 'surveys#index'
  post ':user_name/', to: 'surveys#create'
  post ':user_name/comment', to: 'surveys#comment_and_contact_info'

  resources :dashboard, only: [:index, :show]
end