Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "clients#index"
  scope module: 'clients' do
    resources :clients do
      resources :phone_numbers
    end
  end
end
