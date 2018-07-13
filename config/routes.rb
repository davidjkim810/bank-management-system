Rails.application.routes.draw do

  root 'sessions#new'

  resources :users, only: [:create, :show, :edit, :update]

  resources :accounts, only: [:create, :show, :edit, :update, :destroy] do
    resources :transactions, only: [:new, :create, :destroy]
  end

  get '/logout', to: 'users#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'

end
