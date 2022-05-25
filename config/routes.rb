Rails.application.routes.draw do
  root "toys#index"

  devise_for :users
  resources :toys, only: %i[new create show]
  delete 'toys/:id', to: 'toys#destroy', as: 'delete_toy'
  # get 'toys/:id', to: "toys#show", as: :toy
  # get 'toys/new'
  # get 'toys/create'
end
