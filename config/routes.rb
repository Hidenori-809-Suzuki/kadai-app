Rails.application.routes.draw do
  root "sessions#new"
  # get 'users/new'
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/imageposts/new", to: "imageposts#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users
  resources :imageposts, only: [:create, :destroy]
  get '/imageposts', to: 'sessions#new'
end
