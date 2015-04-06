Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :articles, except: [:index]
  end

  # resources :users, only: [:new, :create]

  get '/users/new' => 'users#new'
  post '/user' => 'users#create'

  resource :session, only: [:new, :create, :destroy]

  root 'categories#index'

end
