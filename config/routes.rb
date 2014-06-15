Faktura::Application.routes.draw do

  resources :users
  resources :companies
  resources :sessions

  resources :invoices do
    resources :items
  end

  get 'logout' => 'sessions#destroy'
  root to: 'users#index'
end
