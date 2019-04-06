Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]
  resources :articles, only: [:index, :show, :create]

  root 'articles#index'
end
