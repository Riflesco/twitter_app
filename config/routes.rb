Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "application#heloblabla"
  get "alta_ruta", to: "application#alta_ruta"
  get "create_user", to: "application#create_user"
  get "main_menu", to: "application#main_menu"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resources :comments, only: [:create]
  end

  resources :relationships, only: [:create, :destroy]
  #get 'users' , to: 'users#index'

  #get 'users/new', to: 'users#new'
  #post 'users/',to: 'users#create'
  #get 'users/:id', to: 'users#show'

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "admin/statistics", to: "application#statistics"
end
