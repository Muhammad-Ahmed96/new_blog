Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/users', to: "users#index"
  # get "/" => "posts#index"
  root "posts#index"
  resources :posts do 
    collection do
      get 'search' => "posts#search"
    end
  end
  get '/signup' => "registrations#new"
  post '/signup' => "registrations#create"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
