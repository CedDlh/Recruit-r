Rails.application.routes.draw do
  #get 'recruiters/index'
  #get 'positions/index'
  #post 'applicants/create'
  #post 'positions/create'

  resources :positions, only: [ :index, :show, :create]
  resources :applicants, only: [ :index, :show, :create]
  resources :recruiters, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
