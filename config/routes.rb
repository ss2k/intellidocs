Uploadocs::Application.routes.draw do
  resources :assets
  get 'query_pie_chart', to: "charts#query_pie_chart", defaults: { format: 'json' }
  get 'charts', to: "charts#index"
  root :to => "assets#index"
end
