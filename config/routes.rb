Rails.application.routes.draw do
  devise_for :users

  get 'surveys', to: 'surveys#index'

  root 'surveys#index'
end
