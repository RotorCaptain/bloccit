Rails.application.routes.draw do


  get 'ratings/show'


  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :advertisements
  resources :questions

  resources :labels, only: [:show]



  
  post 'users/confirm' => 'users#confirm'

  get 'about' => 'welcome#about'

  get 'faq' => 'welcome#faq'

  root to: 'welcome#index'
  
  
 # #19
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update] 
      resources :topics, only: [:index, :show]
      resources :topics, except: [:edit, :new]
        resources :posts, only: [:index, :show]
          resources :comments, only: [:index, :show]
    end
  end
end


