Rails.application.routes.draw do
  resources :user_listings
  resources :user_reports

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/cardcheck/' => 'user_listings#cardcheck', :defaults => { :format => 'json' }
  post '/rate/' => 'users#rate', :defaults => { :format => 'json' }
  get '/users/:id' => 'users#show', as: :showuser
  put '/users/:id' => 'users#update', as: :updateuser
  get '/pages/search_results/' => 'pages#search_results', as: :search
  get '/pages/card/' => 'pages#card', as: :card
  get '/traders/' => 'pages#traders', as: :traders
  end
