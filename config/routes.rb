#We'll remove those in favor of a more succinct way of creating Post routes. Call the resources method, and pass it a symbol. By doing this you instruct Rails to create routes for every CRUD action:

Rails.application.routes.draw do

  resources :posts
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end

#Notice that we also removed the get "welcome/index", because we've declared the index view as root. We also cleaned up the about route, by allowing a user to type /about rather than /welcome/about.
