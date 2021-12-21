Rails.application.routes.draw do
  resources :starships
  resources :people
  root "application#index"
end
