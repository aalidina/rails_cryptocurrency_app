Rails.application.routes.draw do
  get '/auth/github/callback' => 'sessions#create'
  root 'sessions#welcome'

  resources :users,only: [:new, :index, :show, :create]  do
    resources :wallets, only: [:index, :new, :show]
    #new route: users/1/wallets/new
    #show route: users/1/wallet/1
    #index users/1/wallets
    resources :transactions, only: [:index, :new, :show]
    #new users/1/transactions/new
    #show route: users/1/transaction/1
    #index users/1/transactions
  end
  resources :wallets, only: [:creat, :edit, :update]
  resources :transactions, only: [:create, :edit, :update]
  resources :coins , only: [:update]

  get "/signup", to: "users#new" #signup route displays users/new erb and post to
  get "/login", to: "sessions#new" # login route displays sessions/new #erb and post to login
  post "/login",   to: 'sessions#create'
  # the create method in sessions controller finds the user and #verifies the user using the authenticate method.
  get '/logout',  to: 'sessions#destroy'

end
