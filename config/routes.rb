Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :categories
  resources :lessons
  resources :words
  resources :users do
    resources :relationships,  only: [:index]
  end
  resources :relationships, only: [:create, :destroy]

end
