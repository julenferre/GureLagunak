Rails.application.routes.draw do
  
  get 'vote_imgs/new'

  get 'images/new'

  get 'sessions/new'

  root 'images#index'

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

  # Image atala
  get    '/images/uploadphoto', to: 'images#new'
  post   '/images/uploadphoto', to: 'images#create'
  get    '/images/:id',         to: 'images#show'

  # Comment atala
  get    '/comments/:id/new',  to: 'comments#new'
  post   '/comments/:id',      to: 'comments#create'
  get    '/comments/show',     to: 'comments#show'

  # VoteImg atala
  get    '/vote_imgs/:id/new',  to: 'vote_imgs#new'
  post   '/vote_imgs/:id',      to: 'vote_imgs#create'
  get    '/vote_imgs/show', to: 'vote_imgs#show'

  # VoteComm atala
  get    '/vote_comms/:id/new', to: 'vote_comms#new'
  post   '/vote_comms/:id',     to: 'vote_comms#create'
  get    '/vote_comms/show',    to: 'vote_comms#show'


  # Baliabideak
  resources :users
  resources :images
  resources :comments
  resources :vote_imgs
  resources :vote_comms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
