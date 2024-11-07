Rails.application.routes.draw do
  root "habits#index"
  devise_for :users

  resources :habits
  resources :users, only: [:show]
end
