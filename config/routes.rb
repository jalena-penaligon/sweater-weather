Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'background#show'
      resources :users, only: [:create]
      resources :sessions, only: [:create]
    end
  end
end
