Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :cryptids
  resources :categories
  resources :regions

  namespace :api do
    namespace :v1 do
      resources :sightings, only: [:index]
    end
  end
end
