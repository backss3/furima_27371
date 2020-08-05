Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'items#index'
  resources :users, only: :index
  resources :items do
    resources :orders, only:[:index, :new, :create]
  end
end