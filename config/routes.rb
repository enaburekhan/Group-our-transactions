Rails.application.routes.draw do
  root 'application#home'

  #sessions routes
  get     '/login',   to: 'sessions#signin'
  post    '/login',   to: 'sessions#create'
  get  '/logout',  to: 'sessions#destroy'

  #shopping_list routes
  resources :shopping_lists, only: [:index, :show, :new, :edit, :create, :update]
  get     '/external_shopping_lists',  to: 'shopping_lists#list_external'
  get     '/group_shopping_lists',  to: 'shopping_lists#group_shopping_lists'
  get     '/list_order_ancient',  to: 'shopping_lists#list_order_ancient'
  get     '/checkout',  to: 'shopping_lists#checkout'
  get     '/external_shopping_lists',  to: 'shopping_lists#list_external'

  #group routes
  resources :groups, only: [:index, :show, :new, :edit, :create, :update]

  #users routes
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  resources :users, only: [ :show, :new, :create] 
  
  #payments routes
  resources :payments, only: [ :create] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
