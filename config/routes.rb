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
  get "/booking_request", to: "tourdetails#new"
  delete "/user_destroy", to: "admins/users#destroy"
  delete "/tour_destroy", to: "admins/tours#destroy"
  resources :tours do
    resources :reviews, only: %i(create destroy)
  end
  resources :tourdetails
  resources :users do
    resources :reviews, except: :create
  end
  namespace :admins do
    root "home#index"
    resources :tours
    resources :users
  end
end
