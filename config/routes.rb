Rails.application.routes.draw do
  
  get 'sessions/new'

  root 'mains#index'

  # Sign Up
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'

  # Login/logout
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # User atala
  get    '/users/:id',       to: 'users#show'
  get    '/users/:id/photo', to: 'users#show_photo'
  patch  '/users/:id/photo', to: 'users#update_photo'
  get    '/users/:id/pass',  to: 'users#show_pass'
  patch  '/users/:id/pass',  to: 'users#update_password'
  get    '/users/:id/destroy', to: 'users#show_destroy'
  patch  '/users/:id/destroy', to: 'users#destroy'


  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
