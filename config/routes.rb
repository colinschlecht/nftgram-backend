Rails.application.routes.draw do
  resources :likes
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :artists
      resources :arts
      resources :comments
      resources :events
      resources :collections
      resources :users
      post '/login', to: 'auth#login'
      get '/getuser', to: 'users#getuser'
    end
  end
end
