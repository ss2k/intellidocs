Uploadocs::Application.routes.draw do
  devise_for :users, path: 'accounts'
  resources :users do
    resources :assets
    resources :folders, only: [:create] do 
      resources :assets
    end
  end

  resources :assets
  get 'query_pie_chart', to: "charts#query_pie_chart", defaults: { format: 'json' }
  get 'charts', to: "charts#index"
  root :to => "assets#index"
end
