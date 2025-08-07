Rails.application.routes.draw do
  resources :transactions, only: [ :index, :create ]

  namespace :api do
    namespace :v1 do
      resources :transactions, only: [ :index, :create ]
    end
  end

  root "transactions#index"
end
