Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/edit'

  get 'questions/resolved'

  get 'questions/delete'

  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'
  

  get 'posts/question'

  get 'posts/destroy'

  resources :posts
  
  resources :questions

   get 'about' => 'welcome#about'

  root to: 'welcome#index'
 
end
