Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :users
  get '/my_profile', to: 'dashboard#show'
  get '/my_profile/my_posts', to: 'dashboard#my_posts'
  root to: 'pages#home'

  resources :restaurant_dish_forms, only: [ :new, :create ]

  resources :dishes, only: [:show, :new, :create, :destroy] do
    collection do
      get 'search'
      get 'map'
    end
    resources :restaurants, only: [:create]
    resources :reviews, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  resources :restaurants, only: [:show]
end
