Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rentals
  resources :books
  resources :users, only: [:show, :update]
  get 'books/search/:title', to: 'books#search'
  get 'dashboard', to: 'users#dashboard'
  get 'dashboard/hostings', to: 'users#list_hostings'
  get 'dashboard/readings', to: 'users#list_readings'
  get 'dashboard/settings', to: 'users#edit'
end
