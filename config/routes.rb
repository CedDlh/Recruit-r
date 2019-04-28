Rails.application.routes.draw do
  #get 'appointments/create'
  #get 'recruiters/index'
  #get 'positions/index'
  #post 'applicants/create'
  #post 'positions/create'

  resources :positions, only: [ :index, :show, :create]
  resources :applicants, only: [ :index, :new, :show, :create, :update]
  resources :recruiters, only: [:index]
  resources :appointments, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/redirect', to: 'example#redirect', as: 'redirect'
  get '/callback', to: 'example#callback', as: 'callback'
end
