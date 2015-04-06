Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :articles, except: [:index]
  end


  root 'categories#index'

end
