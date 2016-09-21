Rails.application.routes.draw do
  resources :map, only: [:new, :show, :create]
  root 'map#new'
end
