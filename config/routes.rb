Rails.application.routes.draw do

  get    '/login',   to: 'sessions#index'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

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
