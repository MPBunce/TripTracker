Rails.application.routes.draw do
  # Trips routes (RESTful) - renamed from posts
  resources :trips do
    # Nested routes for trip days
    resources :trip_days, only: [:create, :update, :destroy]
    # Nested routes for comments
    resources :comments, only: [:create, :destroy]
  end
  
  # Session and password routes
  resource :session
  resources :passwords, param: :token
  
  # Users routes (RESTful)
  resources :users
  
  # Root and landing
  root "landing#index"
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end