Rails.application.routes.draw do
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
