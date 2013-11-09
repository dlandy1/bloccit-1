Bloccit::Application.routes.draw do

  devise_for :users

  # call the resources method, and pass it the :topics & :posts symbols
  # this instructs Rails to create routes for every CRUD action
  resources :topics do
    # Give Posts a nested route within topics
    # Posts has a URL scoped to topic to follow RESTful conventions
    # i.e. /topics/1/posts/3
    resources :posts, except: [:index]
  end 

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

end