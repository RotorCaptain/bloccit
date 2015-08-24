Rails.application.routes.draw do
  get 'sponsored_post/show'

  get 'sponsored_post/new'

  get 'sponsored_post/edit'

  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'
  
  get 'posts/destroy'

  resources :topics do
    
     resources :posts, except: [:index]
     
     resources :sponsored_post
   end

   get 'about' => 'welcome#about'

  root to: 'welcome#index'
 
end
