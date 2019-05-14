Rails.application.routes.draw do
  apipie
  resources :votes
  resources :options
  resources :polls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "apipie/apipies#index"
end
