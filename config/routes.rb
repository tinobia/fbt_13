Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "users", to: "users#index"
  get "/addtour", to: "tours#new"
  get "/tours", to: "tours#index"
  resources :tours
  resources :users
  namespace :admins do
    resources :tours, only: %i(index destroy update)
    resources :users, only: %i(index destroy)
  end
end
