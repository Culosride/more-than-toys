Rails.application.routes.draw do

  #root "toys#index"
  root "pages#home"

  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/show'
  # root "toys#index"

  devise_for :users

  get "/dashboard", to: "pages#dashboard"
  get "/dashboard/mytoys", to: "pages#mytoys", as: 'mytoys'
  delete 'toys/:id', to: 'toys#destroy', as: 'delete_toy'

  resources :toys, only: %i[new create show index] do
    resources :bookings, only: %i[new create show]
  end
  resources :bookings, only: %i[destroy]
end
