Rails.application.routes.draw do
  root to: "application#health"
  resources :people, only: [:index, :show]
  resources :starships, only: [:index, :show]
end
