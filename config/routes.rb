Rails.application.routes.draw do
  root 'posts#index'

  resources :categories do
    get :sub_categories
  end

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users

  resources :posts do
    member do
      put 'like' => 'posts#upvote'
      put 'unlike' => 'posts#downvote'
    end
  end
  get "/profile", to: "sessions#show", as: "profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
