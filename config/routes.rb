Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :artists
      resources :arts
      resources :comments
      resources :events
      resources :collections
      resources :users
    end
  end
end
