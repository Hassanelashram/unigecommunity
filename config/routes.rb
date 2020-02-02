Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root 'posts#index'
  resources :posts
  get "/profile", to: "sessions#show", as: "profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
