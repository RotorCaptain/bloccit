Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'
  
  get 'posts/destroy'

  resources :topics do
    
     resources :posts, except: [:index]
   end

   get 'about' => 'welcome#about'

  root to: 'welcome#index'
 
end
