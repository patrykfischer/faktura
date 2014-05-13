Faktura::Application.routes.draw do

  resources :users
  resources :companies
  resources :sessions

  get "logout" => "sessions#destroy"
  root to: 'users#index'
end
