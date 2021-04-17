Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  namespace :admin do
    get 'users/index'
  end

  root to: "questions#index"

  get 'unsolves', to: "questions#unsolves"
  get 'solves', to: "questions#solves"
  resources :questions do
    post '/solved', to: "questions#solved"
    resources :answers, only: :create
  end

  resources :users, only: [:index, :new, :create]
  namespace :admin do
    resources :users, only: [:index, :delete]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
