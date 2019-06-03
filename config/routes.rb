Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :users
  get '/my_profile', to: 'dashboard#show'
  get '/my_profile/my_posts', to: 'dashboard#my_posts'
  root to: 'pages#home'

  resources :favorites, only: [:create, :destroy]
  resources :dishes, only: [:show, :new, :create] do
    collection do
      get 'search'
      get 'map'
    end
    resources :reviews, only: [:create]
  end

  resources :restaurants, only: [:show]
end
