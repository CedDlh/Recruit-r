Rails.application.routes.draw do
#get 'positions/index'
#post 'applicants/create'
  #post 'positions/create'
  resources :positions, only: [ :index, :show, :create]
  resources :applicants, only: [ :index, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
