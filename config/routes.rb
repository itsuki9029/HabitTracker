Rails.application.routes.draw do
  get 'home/index'
  get 'comments/create'
  get '/contact', to: 'static_pages#contact'
  post '/contact', to: 'static_pages#create_contact'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

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
