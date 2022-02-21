Rails.application.routes.draw do
  resources :blas
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :big_mac_indices do
        collection do
          get :latest
        end
      end
    end
  end
  
  root 'api/v1/big_mac_indices#index'
end
