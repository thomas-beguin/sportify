Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # resources  :pages, only: %i[show]
  get "/dashboard", to: "pages#show"
  root to: "products#index"
  resources :products do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[edit show update destroy]
  post "bookings/:id/accept", to: "bookings#accept", as: "accept_booking"
  post "bookings/:id/refuse", to: "bookings#refuse", as: "refuse_booking"
end
