Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :cryptids, except: [:delete]

  resources :categories, only: [:index, :show]do
    resources :cryptids, only: [:show]
  end
  resources :regions, only: [:index, :show] do
    resources :cryptids, only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
