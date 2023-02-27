Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[edit update delete]
end
