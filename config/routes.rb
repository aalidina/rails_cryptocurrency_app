Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#welcome'
  resources :coins
  resources :users
  resources :wallets

  get "/signup", to: "users#new" #signup route displays users/new erb and post to
  get "/login", to: "sessions#new" # login route displays sessions/new #erb and post to login
  post "/login",   to: 'sessions#create'
  # the create method in sessions controller finds the user and #verifies the user using the authenticate method.
  get '/logout',  to: 'sessions#destroy'
end
