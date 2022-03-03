Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: :index do
    resources :recaps, only: [:index, :new, :create]
  end
  resources :recaps do
    resources :ratings, only: [:create]
  end
end
