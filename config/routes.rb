Rails.application.routes.draw do
  resources :advertisements

  #refers back to the controller

  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'


end
