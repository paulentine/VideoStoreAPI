Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/zomg", to: "customers#zomg"

  post "rentals/check-out", to: "rentals#checkout"
  post "rentals/check-in", to: "rentals#checkin"

  resources :movies, only: [:index, :show, :create]
  resources :customers, only: [:index]
end
