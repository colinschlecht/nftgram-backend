Rails.application.routes.draw do
  resources :categories
  resources :artists
  resources :arts
  resources :comments
  resources :events
  resources :collections
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
