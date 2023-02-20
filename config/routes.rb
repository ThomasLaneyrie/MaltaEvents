Rails.application.routes.draw do
  get 'attendances/index'
  get 'attendances/show'
  get 'attendances/new'
  get 'attendances/create'
  get 'attendances/edit'
  get 'attendances/update'
  get 'attendances/destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users

end
