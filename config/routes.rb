Rails.application.routes.draw do

  root 'users#new'
  resources :users, only: [:create, :show, :edit, :update]

  get '/logout', to: 'users#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
