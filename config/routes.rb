Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :favorites, only: [:create, :destroy]
  resources :dishes, only: [:show, :new, :create] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create]
  end

  resources :restaurants, only: [:show]
end
