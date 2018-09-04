Rails.application.routes.draw do

  root 'sessions#index'

  resources :users, only: [:create, :show, :edit, :update] do
    resources :accounts, only: [:new, :create, :index, :destroy]
    resources :shares, only: [:show]
  end

  resources :accounts, only: [:show] do
    resources :transactions, only: [:new, :edit, :create, :destroy]
  end

  resources :stocks, only: [:index]

  get '/highest', to: 'transactions#highest'
  get '/logout', to: 'users#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'

end
