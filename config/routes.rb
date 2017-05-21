Rails.application.routes.draw do
  get 'user/signup'

  get 'user/login'

  resources :mains
  root 'mains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
