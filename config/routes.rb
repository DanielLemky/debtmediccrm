Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "clients/clients#index"
  scope module: 'clients' do
    resources :clients do
      resources :addresses
      resources :phone_numbers
      resources :identifications
      resources :employments
    end
  end
end
