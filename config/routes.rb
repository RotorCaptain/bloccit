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

  resources :posts

   get 'about' => 'welcome#about'

  root to: 'welcome#index'
 
end
