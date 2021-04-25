Rails.application.routes.draw do
  get 'products/index'
  get 'products/search'
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
 }
  root to: "items#index"
  resources :items
  get 'items/search'
end