Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :dishes, only: [:show] do
    collection do
      get 'search'
    end
    resources :favorites, [:index, :new, :create] do
      collection do
        get 'my_posted_dishes'
        end
      end
    resources :reviews, [:new, :create]
    resources :restaurants, [:new, :create, :show]
  end
end
