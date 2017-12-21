Rails.application.routes.draw do
  resources :event_posts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get :search, controller: :static
  resources :activity_posts
  resources :module_posts
  devise_for :users

  root to: 'static#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
