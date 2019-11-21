Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rentals
  resources :books
  resources :users, only: [:show, :edit, :update]
  get 'books/search/:title', to: 'books#search'
  get 'dashboard', to: 'users#dashboard'
end
