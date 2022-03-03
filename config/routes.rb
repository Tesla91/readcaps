Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: :index do
    resources :recaps, only: [:index, :new, :create]
  end
  resources :recaps, only: :show do
    resources :ratings, only: [:create, :update]
  end
  resources :ratings, only: [:destroy]
  get 'recaps', to: 'recaps#all_recaps', as: :recaps
end
