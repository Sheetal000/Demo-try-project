Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :posts do
    member do
     put 'like_post'
    end

    collection do
      get :search
      get :services_posts
    end
  end
end
