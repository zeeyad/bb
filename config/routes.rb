Rails.application.routes.draw do
  resources :event_posts
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get :search, controller: :static
  resources :activity_posts
  resources :module_posts
  devise_for :users

  get :select_new_post_option, controller: :static
  root to: 'static#homepage'

  get 'user_imports', to: 'user_imports#index', as: :user_imports
  post 'user_imports', to: 'user_imports#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
