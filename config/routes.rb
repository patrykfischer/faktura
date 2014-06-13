Faktura::Application.routes.draw do

  resources :users
  resources :companies
  resources :sessions
  resources :invoices
  resources :items

  get 'invoices/:invoice_id/items/new'  => 'items#new', as: 'new_items'

  get 'logout' => 'sessions#destroy'
  root to: 'users#index'
end
