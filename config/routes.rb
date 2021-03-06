Rails.application.routes.draw do
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
    }
  root "users/restaurants#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
  	resources :restaurants
  	resources :users, only:[:show, :edit, :update, :destroy]
  	#resourcesにないアクションだからそのまま書いた。
  	get '/users/:id/withdrawal', to: 'users#withdrawal'
  	resources :favorites, only:[:create, :destroy]
    resources :stocks, only:[:create, :destroy]
  	resources :relationships, only:[:create, :destroy]
  	resources :stations, only:[:show]
  end

  namespace :admins do
    root "admins#home"

   	resources :stations, except:[:destroy]
   	resources :users, only:[:index, :show]
    resources :genres
   	#usersのdestroyいるか？
  end
end
