Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root "products#index"
  resources :products do
    resources :orders
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
end
