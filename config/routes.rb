Rails.application.routes.draw do

  devise_for :users
  get    '/login',   to: 'sessions#index'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
 
  root 'users#index'
  resources :users
  resources :products
  resources :cart

  namespace :admin do
    root "static_pages#index"
    get    '/login',   to: 'sessions#index'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :users
    resources :products
  end
end
