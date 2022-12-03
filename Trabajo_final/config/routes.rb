Rails.application.routes.draw do
  resources :appointments
  resources :users
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations',
      unlocks: 'users/unlocks',
    }, :path_prefix => 'devise'

  #make a route that allows client to see their appointments
  get '/appointments', to: 'appointments#index', as: 'client_appointments'
  #make a route that allows client to cancel an appointment
  patch '/appointments/:id/cancel', to: 'appointments#update', as: 'cancel_appointment', :defaults => { :status => 'Canceled' }
  patch '/appointments/:id/finish', to: 'appointments#update', as: 'finish_appointment', :defaults => { :status => 'Finished' }

  resources :branches do
    resources :schedules
    resources :appointments
  end


  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
