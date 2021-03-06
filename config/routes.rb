Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :groups   
  resources :sales
  get 'external', to: 'sales#external'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
