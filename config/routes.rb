Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :users, only: [:index]
  resources :items, only: [:index]
  
end