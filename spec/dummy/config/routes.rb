Rails.application.routes.draw do
  mount PaxfulEngine::Engine => "/paxful_engine"
end
