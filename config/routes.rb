Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/employees",to: "employees#index"
  get "/employees",to: "employees#new"
  get "/employees/:id", to: "employees#show"
end
