Rails.application.routes.draw do



  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
    
  root 'users#index'


  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  resources :users do
    resources :reservations, only: [:show, :index, :destroy]
  end

 
  resources :listings do
    get "delete"
    resources :reservations
    resources :comments
  end

  resources :payments, only: [:new, :create]
  

  get '/users/:user_id/listings', to: "listings#my_listings", as: 'my_listings'
  


end