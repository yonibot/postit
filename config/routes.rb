Postit::Application.routes.draw do
  root to: 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'


  resources :users, only: [:new, :create, :show]

  resources :posts, except: [:destroy] do
    member do
      post 'vote'  #goes to posts#vote
    end
    resources :comments do
      member do
        post 'vote'
      end
    end
  end



  # get 'posts/new', to: 'posts#new'
  # post '/posts', to: 'posts#create'
  # get 'posts/:id', to: 'posts#show'


end