Rails.application.routes.draw do
  devise_for :users
  resources :albums
  resources :artists
  resources :songs do
    resources :comments, only: [:create, :update, :destroy]
  end
  #get '/song/upload', to: 'songs#upload', as: 'song_upload'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "songs#index"
end
