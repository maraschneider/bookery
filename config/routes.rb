Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rentals
  resources :books
  resources :users, only: [:show]
  get 'books/search/:title', to: 'books#search', as: 'search_books'
end
