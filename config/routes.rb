Rails.application.routes.draw do
  resources :map, only: [:new, :create]
  root 'map#new'
end
