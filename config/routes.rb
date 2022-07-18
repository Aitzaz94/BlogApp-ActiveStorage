Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'blogs#index'
  resources :blogs do
    resources :comments
  end

  resources :users

  resources :categories

end
