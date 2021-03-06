Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'registrations'
  }
  root 'restaurants#index'
  resources :restaurants do
    member do
      post :collect
      post :uncollect
    end
    resources :comments, except: [:show, :new] do
      member do
      put "like",    to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
    end
  end
  get :search, controller: :restaurants
  resources :users do
    member do
      get :collection
      get :followings
    end
    collection  do
      patch :position
    end
  end
  
  resources :activities do
    collection  do
      patch :check
    end
  end


  resources :tags, only: [:show]
  resources :followships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    root 'users#index'
    resources :tags
    resources :restaurants do
      collection do
        post :import
      end
    end
    resources :users
  end
end
