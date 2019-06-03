Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :users
  get '/my_profile', to: 'dashboard#show'
  root to: 'pages#home'

  resources :dishes, only: [:show, :new, :create] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create]
    resources :favorites, only: [:create, :destroy]
  end

  resources :restaurants, only: [:show]
end
