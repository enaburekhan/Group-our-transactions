Rails.application.routes.draw do

  #group routes
  resources :groups, only: [:index, :show, :new, :edit, :create, :update]

  #users routes
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  resources :users, only: [ :show, :new, :create]  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
