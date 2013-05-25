Postit::Application.routes.draw do
  root to: 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'


  resources :users, only: [:new, :create, :show]

  resources :posts, except: [:destroy] do
    resources :comments
  end



  # get 'posts/new', to: 'posts#new'
  # post '/posts', to: 'posts#create'
  # get 'posts/:id', to: 'posts#show'


end