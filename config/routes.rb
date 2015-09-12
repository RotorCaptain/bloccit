Rails.application.routes.draw do
  get 'rating/show'

  resources :labels, only: [:show]
  
  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'
  
  get 'posts/destroy'

  resources :topics do
    
    resources :posts, except: [:index]
    
   end
   
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :advertisements
  resources :questions
  resources :users, only: [:new, :create]
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :advertisements
  resources :questions
  
  post 'users/confirm' => 'users#confirm'
  
   get 'about' => 'welcome#about'

  root to: 'welcome#index'
 
end
