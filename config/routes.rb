Rails.application.routes.draw do
  get 'gulag/index'

  root 'gulag#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
