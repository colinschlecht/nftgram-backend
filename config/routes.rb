Rails.application.routes.draw do
  resources :likes
  namespace :api do
    namespace :v1 do
      resources :categories
          resources :arts
      resources :comments
              resources :users
      resources :likes
      post '/login', to: 'auth#login'
      get '/getuser', to: 'users#getuser'
      get '/explore/:page', to: 'arts#explore'
      get '/generate', to: 'users#generate'
    end
  end
end
