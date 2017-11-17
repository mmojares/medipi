
Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :items
  resources :tables, constraints: lambda { |req| req.format == :json } do
    resources :chairs, constraints: lambda { |req| req.format == :json }
  end
  post 'sign_in', to: 'login#sign_in', constraints: lambda { |req| req.format == :json }
  post 'authenticate', to: 'authentication#authenticate', constraints: lambda { |req| req.format == :json }
end