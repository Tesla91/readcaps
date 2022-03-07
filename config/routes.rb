Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books, only: :index do
    resources :recaps, only: [ :index, :new, :create ]
  end
  resources :recaps, only: [ :show, :destroy, :edit, :update ] do
    resources :ratings, only: :create
    resources :favorites, only: :create
  end
  resources :ratings, only: [:destroy, :update]
  get 'recaps', to: 'recaps#all_recaps', as: :recaps

  resources :dashboard, only: :index
end
