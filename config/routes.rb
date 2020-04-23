Rails.application.routes.draw do
  resources :dashboards
  resources :topics do
    resources :opinions
  end
  get '/homepage', to: 'posts#homepage'
  root 'posts#homepage'


  resources :categories do
    get :sub_categories
  end

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  get "/users/:id", to: "users#show", as: "userprofile"

  resources :posts do
    member do
      put 'like' => 'posts#upvote'
      put 'unlike' => 'posts#downvote'
    end

    resources :comments

  end

  get "/profile", to: "sessions#show", as: "profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
