Rails.application.routes.draw do
  root 'sales#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :groups do
    resources :sales
  end  

  resources :sales
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
