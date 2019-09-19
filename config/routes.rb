Rails.application.routes.draw do
	root "users/restaurants#index"
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
  	resources :restaurants
  	resources :users, only:[:show, :edit, :update, :destroy]
  	#resourcesにないアクションだからそのまま書いた。
  	get '/users/:id/withdrawal', to: 'users#withdrawal'
  	resources :favorites, only:[:create, :destroy]
  	resources :relationships, only:[:create, :destroy, :index]
  	resources :stations, only:[:show]
  	resources :tags, only:[:new, :create, :destroy, :update]
  	#tagsのupdateいる？
  end

  namespace :admins do
  	resources :stations, except:[:destroy]
  	resources :users, only:[:index, :show, :destroy,]
  	#usersのdestroyいるか？
  	#quitのアクションどう指定しようか？
  end
end
