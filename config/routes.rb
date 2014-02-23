Floatilla::Application.routes.draw do

  root to: "gauges#index"

  resources :rivers

  namespace :api do
    namespace :v1, :defaults => { :format => 'json' } do
      resources :gauges, only: [:index]
    end
  end
end
