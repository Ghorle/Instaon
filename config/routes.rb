Rails.application.routes.draw do
  devise_for :users
  root 'images#index'

  resources :likes, only: [:create, :destroy]

  get '/upload', to: 'images#new'
  resources :images, only: [:index, :show, :create, :destroy] do
    resources :comments, only: [:show, :create, :destroy]
  end
  get '/@:username', to: 'users#show', as: :profile
  get '/properties/:id', to: 'users#index', as: :property
end
