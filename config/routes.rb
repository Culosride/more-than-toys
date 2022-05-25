Rails.application.routes.draw do
  #root "toys#index"
  root to: 'pages#home'
  devise_for :users
  resources :toys, only: %i[new create show]
  # get 'toys/:id', to: "toys#show", as: :toy
  # get 'toys/new'
  # get 'toys/create'

end
