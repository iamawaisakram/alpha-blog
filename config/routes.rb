Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#homepage'
  get 'about', to: 'pages#about'

  resources :articles

  get 'signup', to: 'users#new'
  # 1st method:
  #post 'users', to:'users#create'

  # 2nd Method
  resources :users, except: [:new]
end
