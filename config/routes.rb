Rails.application.routes.draw do
  #get 'payments/index'
  #get 'payments/show'
  #get 'payments/new'
  #get 'payments/create'
  #get 'payments/destroy'
  resources :payments
  resources :ranks
  resources :states
  #resources :payments, only: [:show]
  devise_for :users
  resources :borangs
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  get 'home/about'
  

  resources :users
resources :users do
  member do
    get 'validate_user'
  end
end



  get '/allusers', to: 'users#index', as: 'all_users'
  post '/users/:id/validate_user', to: 'users#validate_user', as: 'validate_user'

  resources :borangs do
    get :new_for_user, on: :collection  
  end

  resources :borangs do
    post '/borangs/:id', to: 'users#view_borang', as: 'view_borang'
  end

  resources :borangs do
    post :payment_redirect
  end

  resources :borangs do
    member do
      get 'print'
    end
  end

  


  
end
