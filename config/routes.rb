Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end

  resources :microposts, only: [:create, :destroy] do
    resource :like, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
