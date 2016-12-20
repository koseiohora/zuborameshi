Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  #get 'recipes' => 'recipes#index'
  #get 'recipes/new' => 'recipes#new'
  #post 'recipes' => 'recipes#create'
  #delete 'recipes/:id' => 'recipes#destroy'
  #patch 'recipes/:id' => 'recipes#update'
  #get 'recipes/:id/edit' => 'recipes#edit'
  #get 'users/:id' => 'users#show'
  #get 'recipes/:id' => 'recipes#show'
  # get 'recipes/about' => 'recipes#about'
  resources :recipes do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show]

end