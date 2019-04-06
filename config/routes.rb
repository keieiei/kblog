Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]
  resources :articles                       do
    resources :likes, only: [:index,:create, :destroy]
  end
  root 'articles#index'
end
