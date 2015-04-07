Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :articles, except: [:index]
  end

 

  # resources :users, only: [:new, :create]
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'


# reources way
# resources :users, only: [:new, :create]
# users POST /users(.:format)     users#create
# new_user GET  /users/new(.:format) users#new
# long way
# get '/users/new' => 'users#new'
# post '/users' => 'users#create'
# users_new GET  /users/new(.:format) users#new
# users POST /users(.:format)     users#create

  # resource :session, only: [:new, :create, :destroy]
  get  'session/new' => 'sessions#new'
  post 'session' => 'sessions#create'
  delete 'session' => 'sessions#destroy'

  root 'categories#index'

end
