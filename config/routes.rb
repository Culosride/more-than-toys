Rails.application.routes.draw do
  root "toys#index"

  resources :toys, only: %i[new create show]
  devise_for :users
  # get 'toys/index'
  # get 'toys/:id', to: "toys#show", as: :toy
  # get 'toys/new'
  # get 'toys/create'
end
