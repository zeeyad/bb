Rails.application.routes.draw do
  root to: 'static#homepage'
  get :search, controller: :static
  get :select_new_post_option, controller: :static
  get :about, controller: :static

  resources :activity_posts do
    member do
      get :approve
      get :reject
    end
    collection do
      get :archive_posts
    end
  end
  resources :event_posts do
    member do
      get :approve
      get :reject
    end
    collection do
      get :archive_posts
    end
  end
  resources :module_posts do
    member do
      get :approve
      get :reject
    end
    collection do
      get :archive_posts
    end    
  end

  resources :user_dashboards
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'user_imports', to: 'user_imports#index', as: :user_imports
  post 'user_imports', to: 'user_imports#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
