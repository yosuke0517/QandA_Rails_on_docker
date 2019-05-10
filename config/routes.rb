Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  root 'questions#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'answers/edit'
  resources :questions do
    resources :answers
  end
  resources :users, only: [:index, :show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
