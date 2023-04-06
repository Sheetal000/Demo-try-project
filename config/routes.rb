# require 'sidekiq'
# require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  # Defines the root path route ("/")
  root "home#index"

  # devise_for :users, controllers: { registrations: 'devise_token_auth/registrations' }

  # post '/signup', to: 'devise_token_auth/registrations#new', as: "signup"
  # post '/auth/sign_up', to: 'auth#create'

  resources :posts do
    get '/page/:page', action: :index, on: :collection
    member do
     get 'like_post'
    end

    collection do
      get :search
      get :services_posts
    end
  end

  resources :users
  post '/auth/login',to: 'authentication#login'
end
