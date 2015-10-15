Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users
end
