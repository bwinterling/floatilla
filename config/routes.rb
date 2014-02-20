Floatilla::Application.routes.draw do

  root to: "gauges#index"

  resources :rivers
end
