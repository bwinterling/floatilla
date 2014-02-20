Floatilla::Application.routes.draw do

  root to: "gauges#index"

  resources :rivers

  namespace :api do
    namespace :v1 do
      resources :gauges, only: [:index]
    end
  end
end
