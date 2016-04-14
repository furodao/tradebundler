Rails.application.routes.draw do
  devise_for :buyers, controllers: { registrations: "buyers" }
  devise_for :sellers, controllers: { registrations: "sellers" }
  resources :offers
  resources :specs
  resources :sellers do
    get :dashboard
  end
  resources :buyers do
    get :dashboard
  end
  resources :orgs

  get '/dashboard', to: 'home#dashboard', as: :dashboard

  get '/sign_in', to: 'sessions#new', as: :sign_in
  post '/sign_in', to: 'sessions#create'
  #delete '/sign_out', to: 'sessions#destroy'

  get '/register', to: 'home#register', as: :register

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index'
end
