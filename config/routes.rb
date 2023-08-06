Rails.application.routes.draw do
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :purchases
  devise_for :users
  root 'items#index'
end