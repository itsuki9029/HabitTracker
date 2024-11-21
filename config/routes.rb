Rails.application.routes.draw do
  get 'comments/create'
  root "habits#index"
  devise_for :users

  resources :habits do
    resources :comments, only: [:create, :edit, :update, :destroy]
    member do
      patch 'toggle_progress', to: 'habit_progresses#toggle'
    end
  end
  resources :users do
    member do
      post 'follow', to: 'users#follow'
      delete 'unfollow', to: 'users#unfollow'
      get 'followers'
      get 'following'
    end
  end
end
