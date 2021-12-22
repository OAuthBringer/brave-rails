Rails.application.routes.draw do
  root to: "application#health"
  post :swapi, controller: :application, method: :swapi
end
