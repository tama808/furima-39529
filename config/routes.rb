Rails.application.routes.draw do
  resources :items
  resources :purchases
  devise_for :users
  root 'items#index'
end