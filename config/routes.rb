Rails.application.routes.draw do
  get 'comments/create'
  root "habits#index"
  devise_for :users

  resources :habits do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:show]
end
