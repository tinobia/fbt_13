Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  root "sessions#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :users
end
