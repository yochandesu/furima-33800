Rails.application.routes.draw do
  devise_for :users

  root to: 'item#index'
 

  resources :users
end
