PaxfulEngine::Engine.routes.draw do
  resources :trades, only: [:index, :show]
end
