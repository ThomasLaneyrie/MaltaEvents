Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "attendances#index"
  devise_for :users
  resources :users, only: [:show]
  resources :attendances
  resources :events, only: [:index, :new, :create, :show]
end
