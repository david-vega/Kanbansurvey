Rails.application.routes.draw do
  devise_for :users

  get 'surveys', to: 'surveys#index'
  post 'surveys', to: 'surveys#create'

  root 'surveys#index'
end
