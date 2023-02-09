Rails.application.routes.draw do
  devise_for :users
  resources :albums
  resources :artists
  resources :songs do
    resources :comments, only: [:create, :update, :destroy]
  end
  get '/user/:user_id/songs', to: 'songs#index_by_user'
  get '/user/preferences', to: 'users#preferences', as: 'user_preferences'
  get '/search', to: 'songs#search', as: 'search'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "songs#index"
end
