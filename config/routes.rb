Rails.application.routes.draw do
  resources :scores
  resources :challengers
  resources :games
  devise_for :users
  root "games#index"

  get "/all_games", to: "games#all"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
