Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources  :users, only: %i[show edit]
  root to: "products#index"
  resources :products do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[edit update delete]
end
