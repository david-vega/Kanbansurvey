Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    delete '/logout', to: 'devise/sessions#destroy'
  end

  get ':user_name/', to: 'surveys#index'
  post ':user_name/', to: 'surveys#create'
  post ':user_name/comment', to: 'surveys#comment_and_contact_info'

  resources :dashboard, only: [:index, :show]

  devise_scope :user do
    root to: "devise/registrations#new"
  end
end
