Rails.application.routes.draw do
  resources :bookmarks

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
