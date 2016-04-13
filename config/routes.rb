Rails.application.routes.draw do
  devise_for :buyers
  devise_for :sellers
  resources :offers
  resources :specs
  resources :sellers
  resources :buyers
  resources :orgs

  get '/dashboard', to: 'home#dashboard', as: :dashboard
  get '/sign_in', to: 'home#sign_in', as: :sign_in

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index'
end
