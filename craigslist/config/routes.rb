Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :articles, except: [:index]
  end

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  root 'categories#index'

end
