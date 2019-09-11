Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user do
  	resourses :restaurants
  	resourses :users
  	resourses :favorites
  	resourses :relationships
  	resourses :stations
  	resourses :tags
  end

  namespace :admins do
  	resourses :stations
  	resourses :users
  end
end
