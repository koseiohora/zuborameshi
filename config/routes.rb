Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'recipes#index'
  #show'#get 'recipes' => 'recipes#index'
  #get 'recipes/new' => 'recipes#new'
  #post 'recipes' => 'recipes#create'
  #delete 'recipes/:id' => 'recipes#destroy'
  #patch 'recipes/:id' => 'recipes#update'
  #get 'recipes/:id/edit' => 'recipes#edit'
  #get 'users/:id' => 'users#show'
  #get 'recipes/:id' => 'recipes
  get 'recipes/about' => 'recipes#about'
  get 'recipes/ranking' => 'recipes#ranking'
  get 'recipes/genre' => 'recipes#genre'
  get 'recipes/genre_search' => 'recipes#genre_search'
  resources :recipes do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy], shallow: true

    collection do
      get 'search'
    end
  end

  resources :users, only: [:show]

end