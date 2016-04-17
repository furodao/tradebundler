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
  resources :contacts

  get '/dashboard', to: 'home#dashboard', as: :dashboard

  get '/sign_in', to: 'sessions#new', as: :sign_in
  post '/sign_in', to: 'sessions#create'

  get '/register', to: 'home#register', as: :register

  root to: 'home#index'
end
