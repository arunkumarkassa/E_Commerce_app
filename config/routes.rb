Rails.application.routes.draw do
  get 'privacy_policies/index'
  get 'privacy_policies/show'
  get 'helps/index'
  get 'helps/show'
  get 'about_us/index'
  get 'about_us/show'
  get '/terms_and_conditions', to: 'terms_and_conditions#index'
  get '/terms_and_conditions', to: 'terms_and_conditions#show'
  get '/products/index', to: 'products#index'
  get '/products/show', to: 'products#show'
  post '/products/create', to: 'products#create'
  post '/products/update', to: 'products#update'
  delete '/products/delete', to: 'products#delete'
  post '/favorites/create', to: 'favorites#create'
  get '/favorites/index', to: 'favorites#index'
  delete '/favorites/delete', to: 'favorites#destroy'
  post '/signup', to: 'customers#create'
  post '/signin', to: 'authentications#create'
  post '/forgot_password', to: 'passwords#forgot'
  post '/reset_password', to: 'passwords#reset'
  put '/update_password', to: 'passwords#update_password'
  post '/address/create', to: 'addresses#create'
  get '/address/index', to: 'addresses#index'

  devise_for :models
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :terms_and_conditions, only: [:index, :show]
  resources :about_us, only: [:index, :show]
  resources :helps, only: [:index, :show]
  resources :privacy_policies, only: [:index, :show]
  resources :products
  resources :favorites
  resources :customers
  resources :addresses
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
