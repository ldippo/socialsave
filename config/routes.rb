Rails.application.routes.draw do
  resources :bookmarks
  resources :favorites, only: [:create, :destroy]
  resources :tags, only:[:show]
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
