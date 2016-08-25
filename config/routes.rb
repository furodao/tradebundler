Rails.application.routes.draw do
  devise_for :buyers, controllers: { registrations: "buyers" }
  devise_for :sellers, controllers: { registrations: "sellers" }
  resources :offers do
    post :accept
    post :reject
  end
  resources :specs
  resources :sellers do
    get :dashboard
  end
  resources :buyers do
    get :dashboard
  end
  resources :orgs, only: [:new, :update, :create, :destroy, :show]
  resources :contacts
	resources :contracts, only: [:index]

	post :book_new_meeting, to: 'meetings#book_new_meeting', as: :book_new_meeting

  get '/dashboard', to: 'home#dashboard', as: :dashboard

  get '/sign_in', to: 'sessions#new', as: :sign_in
  post '/sign_in', to: 'sessions#create'

  get '/register', to: 'home#register', as: :register

  root to: 'home#index'
end
