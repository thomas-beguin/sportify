Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources  :pages, only: %i[show]
  root to: "products#index"
  resources :products do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[edit show update delete]
end
