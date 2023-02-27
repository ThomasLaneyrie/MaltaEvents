Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "events#index"
  devise_for :users
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :events, only: [:index, :new, :create, :show] do
    resources :photoevents, only: [:create]
    scope '/checkout' do
      post 'create', to: 'checkout#create', as: 'checkout_create'
      get 'success', to: 'checkout#success', as: 'checkout_success'
      get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
      resources :attendances, only: [:new, :create, :index]
    end
  end

  namespace :admin do
    root "users#index"
    resources :users, :events
  end
end
