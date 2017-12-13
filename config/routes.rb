Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "users", to: "users#index"
  get "/tours", to: "tours#index"
  get "/search", to: "tours#search"
  delete "/user_destroy", to: "admins/users#destroy"
  delete "/tour_destroy", to: "admins/tours#destroy"
  resources :tours
  resources :users
  resources :tourdetails
  namespace :admins do
    root "home#index"
    resources :tours
    resources :users
  end
end
