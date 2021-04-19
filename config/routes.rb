Rails.application.routes.draw do
  
  namespace :admin do
    get '/login', to: "sessions#new"
    post '/login', to: "sessions#create"
    delete '/logout', to: "sessions#destroy"
  end
  root to: "questions#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get 'unsolves', to: "questions#unsolves"
  get 'solves', to: "questions#solves"

  resources :questions do
    post '/solved', to: "questions#solved"
    resources :answers, only: :create
  end
  
  resources :users, only: [:index, :new, :create, :edit, :update]
  
  namespace :admin do
    resources :users
    resources :questions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
