Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :passwords, only: [:edit, :update]
  resources :password_resets, only: [:new, :create]
  get "/password_resets/edit", to: "password_resets#edit", as: "edit_password_reset"
  patch "/password_resets", to: "password_resets#update"
end
