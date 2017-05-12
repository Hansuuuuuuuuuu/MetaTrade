Rails.application.routes.draw do
  resources :user_listings
  resources :user_reports
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/cardcheck/' => 'user_listings#cardcheck', :defaults => { :format => 'json' }
  get '/users/:id' => 'users#show'
  end
