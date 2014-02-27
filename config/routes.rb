Floatilla::Application.routes.draw do

  root to: "gauges#index"

  resources :rivers

  namespace :api do
    namespace :v1 do
      resources :gauges, only: [:index]
      resources :rivers, only: [:index, :show] do
        resources :runs, only: [:index, :show]
      end
    end
  end
end
