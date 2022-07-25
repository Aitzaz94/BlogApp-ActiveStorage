Rails.application.routes.draw do
  resources :search_opmtimizations
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

  resources :search_optimizations

end
