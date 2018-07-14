Rails.application.routes.draw do

  root 'sessions#index'

  resources :users, only: [:create, :show, :edit, :update] do
    resources :accounts, only: [:new, :create]
  end

  resources :accounts, only: [:show, :edit, :update, :destroy] do
    resources :transactions, only: [:new, :edit, :update, :create, :destroy]
  end

  get '/logout', to: 'users#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
end
