Rails.application.routes.draw do
  resources :search_opmtimizations
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'blogs#index'
  resources :blogs do
    # update :purge_image
    resources :comments
    member do
      delete :purge_image
      get :update_image
      # edit :purge_edit_image
    end
  end

  # get 'blogs/image_update', to: 'blogs#image_update'

  resources :users

  resources :categories

  resources :search_optimizations

  # mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
