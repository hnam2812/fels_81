Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "statictics" => "static_pages#statictics"
  get "login" => "sessions#new"
  get "signup" => "users#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  namespace :admin do
    root "dashboard#home"
    resources :words
    resources :categories
    resources :users
  end

  resources :categories
  resources :lessons
  resources :words, only: [:index]
  resources :users, except: [:destroy] do
    resources :relationships, only: [:index]
  end
  resources :relationships, only: [:create, :destroy]

end
