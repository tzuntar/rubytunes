Rails.application.routes.draw do
  devise_scope :user do
    get '/user/preferences' => 'devise/registrations#edit', as: 'user_preferences'
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :albums
  resources :artists
  resources :songs do
    resources :comments, only: [:create, :update, :destroy]
  end
  get '/user/:user_id/songs', to: 'songs#index_by_user'
  get '/search', to: 'search#show', as: 'search'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "songs#index"

  # Public JSON API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      #resources :albums
      #resources :artists
      resources :songs# do
      #resources :comments, only: [:create, :update, :destroy]
      #end
      get '/user/:user_id/songs', to: 'songs#index_by_user'
    end
  end
end
