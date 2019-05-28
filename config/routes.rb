Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :dishes, only: [:show, :new, :create] do
    collection do
      get 'search'
    end
    resources :favorites, only: [:index, :new, :create] do
      collection do
        get 'my_posted_dishes'
        end
      end
    resources :reviews, only: [:new, :create]
    resources :restaurants, only: [:new, :create, :show]
  end
end
