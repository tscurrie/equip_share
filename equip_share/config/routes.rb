Rails.application.routes.draw do
  
  root to: 'pages#home'

  get '/', to: 'pages#home', as: 'home'

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  get '/items', to: 'items#index', as: 'items'
  get '/users/:id/items', to: 'items#user_items', as: 'user_items'
  get '/users/:id/items/new', to: 'items#new', as: 'add_item'
  post '/items', to: 'items#create'
  get '/users/:id/items/:id', to: 'items#user_item_show', as: 'user_item_show'
  get '/items/:id', to: 'items#show', as: 'item'
  get '/items/:id/edit', to: 'items#edit', as: 'edit_item'
  patch '/items/:id', to: 'items#update'
  delete '/items/:id', to: 'items#destroy'

  resources :items do
    resources :requests
  end
  get '/users/:id/requests', to: 'requests#incoming', as: 'request_incoming'
  get '/users/:id/requests', to: 'requests#outgoing', as: 'request_outgoing'

end
