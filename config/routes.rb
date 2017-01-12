Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'login' => 'user_sessions#new', :as => :login

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]
end
