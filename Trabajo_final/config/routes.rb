Rails.application.routes.draw do
  resources :branches do
    resources :office_hours
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
p Rails.application.routes.routes
