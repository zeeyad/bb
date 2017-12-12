Rails.application.routes.draw do
  resources :cs_modules
  devise_for :users

  root to: 'static#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
