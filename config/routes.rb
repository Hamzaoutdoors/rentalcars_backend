Rails.application.routes.draw do
  resources :descriptions
  resources :cities

  namespace :api, defaults: {format: 'json'} do  
    namespace :v1 do 
      resources :cars, only: %i[index show]
      resources :users do 
        resources :cars, only: %i[index show create new destroy]
        resources :reservations, only: %i[index show create new destroy]
      end
     end
  end

  root "api/v1/users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
