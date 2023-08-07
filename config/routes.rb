Rails.application.routes.draw do
  resources :items do
    resources :purchases, only: [:index,:create,:show] # ネスト（itemのpurcheaseにしたいから）されたリソースとしてcreateアクションのみ使用する場合
  end
  devise_for :users
  root 'items#index'
end