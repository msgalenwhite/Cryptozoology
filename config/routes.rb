Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :sightings, only: [:index]
    end
  end

  resources :cryptids, except: [:delete]

  resources :categories, only: [:index, :show]do
    resources :cryptids, only: [:show]
  end
  resources :regions, only: [:index, :show] do
    resources :cryptids, only: [:show]
  end
end
