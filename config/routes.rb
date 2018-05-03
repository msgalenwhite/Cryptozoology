Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :sightings, only: [:index]
    end
  end

  resources :sightings, only: [:new, :create]

  resources :categories, only: [:index, :show]do
    resources :cryptids, only: [:show]
  end
  resources :regions, only: [:index, :show] do
    resources :cryptids, only: [:show]
  end

  resources :cryptids, except: [:index]
  resources :users, only: [:index]
end
