Rails.application.routes.draw do
  resources :offers
  resources :specs
  resources :sellers
  resources :buyers
  resources :orgs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index'
end
