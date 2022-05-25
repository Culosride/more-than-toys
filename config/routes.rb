Rails.application.routes.draw do
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/show'
  root "toys#index"

  devise_for :users

  resources :toys, only: %i[new create show] do
    resources :bookings, only: %i[new create destroy show]
  end
  # get 'toys/:id', to: "toys#show", as: :toy
  # get 'toys/new'
  # get 'toys/create'
end
