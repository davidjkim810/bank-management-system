Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#new'
  resources :users, only: [:new, :create, :show, :edit, :update]
  get '/logout', to: 'users#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
