Rails.application.routes.draw do
  root 'sessions#welcome'

  resources :users,only: [:new, :show, :create]  do
    resources :wallets, only: [:index, :show]
    resources :transactions, only: [:index, :show]
  end
  resources :wallets, only: [:index, :show, :new, :create, :edit, :update]
  resources :transactions
  resources :coins , only: [:update]

  get "/signup", to: "users#new" #signup route displays users/new erb and post to
  get "/login", to: "sessions#new" # login route displays sessions/new #erb and post to login
  post "/login",   to: 'sessions#create'
  # the create method in sessions controller finds the user and #verifies the user using the authenticate method.
  get '/logout',  to: 'sessions#destroy'
end
