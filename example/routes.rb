Rails.application.routes.draw do
  namespace :sessions do
    post "create"
    put "update"
  end
  resources :users
  get "up" => "rails/health#show", as: :rails_health_check
end
