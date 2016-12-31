Rails.application.routes.draw do
  get 'map' => 'map#show_query'
  resources :map, only: [:new, :show, :create]
  root 'map#new'
end
