Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :passwords, only: [:edit, :update]
  resources :password_resets, except: [:destroy]
end
