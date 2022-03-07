Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books, only: :index do
    resources :recaps, only: :index
  end
  resources :recaps, only: [ :show, :destroy, :edit, :update, :new, :create ] do
    resources :ratings, only: :create
    resources :favorites, only: :create
  end
  resources :ratings, only: [:destroy, :update]
  get 'all_recaps', to: 'recaps#all_recaps', as: :recaps_all
  resources :dashboard, only: :index
end
