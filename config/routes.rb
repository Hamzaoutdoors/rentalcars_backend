Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :descriptions
  resources :cities

  namespace :api, defaults: {format: 'json'} do  
    namespace :v1 do 
      resources :cars, only: %i[index show create destroy]
      resources :reservations, only: %i[index show create new destroy]
     end
  end

  post '/signup', to: 'api/v1/users#create'
  post '/login', to: 'api/v1/users#login'

  root "api/v1/users#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
