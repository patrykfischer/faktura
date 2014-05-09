Faktura::Application.routes.draw do

  resources :users
  resources :companies
  resources :logins

  get "logout" => "logins#destroy"
  root to: 'users#index'
end
