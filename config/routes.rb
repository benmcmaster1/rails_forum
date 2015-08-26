Rails.application.routes.draw do
  
  #so you can go to new, has access to :id of the post etc. Viewable by 'rake routes'.
  resources :posts
  
  #sets the root path to go to the posts controller, index action
  root 'posts#index'
  
end
