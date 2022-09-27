Rails.application.routes.draw do
  
  resources :user_stocks
  get 'users/my_portfolio'
  devise_for :users
  root "welcomes#index"
  get 'my_portfolio', to:"users#my_portfolio"
  get 'search_stock',to:'stocks#search'
  get 'search_friend',to:'users#search'

  get 'my_friend', to: "users#my_friends"
  resources :friendships
  resources :users
end
