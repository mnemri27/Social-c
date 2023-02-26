Rails.application.routes.draw do
 
  get 'profiles/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :account do
    get '/accounts', to: 'devise/registrations#new'
    get '/accounts/password', to: 'devise/passwords#new'
    #user sign out 
    get '/accounts/sign_out' => 'devise/sessions#destroy' 
    
  end

  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations'
  }
  resources :accounts, only: [:show]
  
  post 'accounts/:id/follow', to: "accounts#follow", as: "follow"
  post 'accounts/:id/unfollow', to: "accounts#unfollow", as: "unfollow"
  post 'accounts/:id/accept', to: "accounts#accept", as: "accept"
  post 'accounts/:id/decline', to: "accounts#decline", as: "decline"
  post 'accounts/:id/cancel', to: "accounts#cancel", as: "cancel"


  get "/dashboard" => "accounts#index"
  get "/mypage" => "posts#myposts"
  
  
  
  resources :posts
  resources :comments
  resources :rooms do
    resources :messages
  end

  resources :likes, only: [:create, :destroy]



  # Defines the root path route ("/")
  # root "articles#index" 

  root "public#homepage"
end