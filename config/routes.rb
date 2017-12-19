Rails.application.routes.draw do
  get :search, controller: :static
  resources :cs_activity_posts
  resources :cs_module_posts
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'static#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
