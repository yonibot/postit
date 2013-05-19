Postit::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy]

  # get 'posts/new', to: 'posts#new'
  # post '/posts', to: 'posts#create'
  # get 'posts/:id', to: 'posts#show'


end
