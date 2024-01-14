Rails.application.routes.draw do    
  root "home#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :games
  
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  get "playgame", to: "games#playgame", as: "playgame"
  post "playgame", to: "games#getoptions", as: "getoptions"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
