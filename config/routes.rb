Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy" 
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "users#top"
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end
  
  get "/users/:user_id/relationships/create", to: "relationships#create"
  get "/users/:user_id/relationships/destroy", to: "relationships#destroy"

  get "/users/:user_id/followings", to: "relationsships#followings"
  get "/users/:user_id/followers", to: "relationsships#followers"


  get "/users/:id", to: "users#show"


  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create]
  end
  
  get "/posts/:id/destroy", to: "posts#destroy"

  get "posts/:id/favorites/create", to: "favorites#create"
  get "posts/:id/favorites/destroy", to: "favorites#destroy"

  get "posts/:post_id/post_comments/new", to: "post_comments#new"
  get "post_comments/:post_comment_id/destroy", to: "post_comments#destroy"




  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
    end
  end
  
  get "/db_status", to: "health#db_status"

end
