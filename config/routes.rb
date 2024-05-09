Rails.application.routes.draw do
  resources :screens
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  get 'pages/index', to: 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "users/:user_id/screens", to: "screens#user_index", as: "user_screens"

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'screens#user_index'
end
