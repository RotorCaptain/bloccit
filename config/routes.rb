Rails.application.routes.draw do
  resources :posts

   get 'about' => 'welcome#about'
   
   get 'faq' => 'welcome#faq'

  root to: 'welcome#index'
 
end
