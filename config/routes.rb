Rails.application.routes.draw do
  resources :groups
  resources :sales
  root 'sales#index'
  devise_for :users
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
