Rails.application.routes.draw do

  root to: 'store#index', as: 'store'

  devise_for :users , :controllers => {:registrations => 'users/registrations'}
  #get '/' => 'store#index', as: 'store'

  resources :items, only: [:show, :index, :update]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]
  resources :carts
  resources :line_items, only: [:create, :update]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
