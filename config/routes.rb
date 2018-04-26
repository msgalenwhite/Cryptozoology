Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :cryptids
  resources :categories
  resources :regions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
