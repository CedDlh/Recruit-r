Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'
  #get 'appointments/create'
  #get 'recruiters/index'
  #get 'positions/index'
  #post 'applicants/create'
  #post 'positions/create'

  resources :positions, only: [ :index, :show, :create, :new]
  resources :applicants, only: [ :index, :new, :show, :create, :update]
  resources :recruiters, only: [:index]
  resources :appointments, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/redirect', to: 'calendar#redirect', as: 'redirect'
  get '/callback', to: 'calendar#callback', as: 'callback'
  get '/calendars', to: 'calendar#calendars', as: 'calendars'
  post '/events', to: 'calendar#new_event', as: 'new_event', calendar_id: /[^\/]+/
  get '/events', to: 'calendar#appointment_confirmed', as: 'appointment_confirmed'
end
