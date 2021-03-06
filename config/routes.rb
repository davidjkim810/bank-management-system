Rails.application.routes.draw do

  root 'sessions#index'

  resources :users, only: [:create, :show, :edit, :update] do
    resources :accounts, only: [:new, :create, :index, :destroy]
    resources :stocks, only: [:index, :create]
    resources :shares
  end

  resources :accounts, only: [:show] do
    resources :transactions, only: [:new, :edit, :create, :destroy]
  end


  get '/highest', to: 'transactions#highest'
  get '/logout', to: 'users#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'

end
