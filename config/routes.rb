Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :sightings, only: [:index]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :user_votes
    end
  end

  resources :sightings, only: [:new, :create]

  resources :categories, only: [:index, :show]do
    resources :cryptids, only: [:show]
  end
  resources :regions, only: [:index, :show] do
    resources :cryptids, only: [:show]
  end

  resources :cryptids
  resources :users
end
