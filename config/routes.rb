Rails.application.routes.draw do
  
  devise_for :users
  #so you can go to new, has access to :id of the post etc. Viewable by 'rake routes'.
  #the do block means that comments are nested in posts
  resources :posts do
    resources :comments
  end
  
  #sets the root path to go to the posts controller, index action
  root 'posts#index'
  
end
