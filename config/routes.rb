Rails.application.routes.draw do
  resources :users
  resources :schools, only: [:index, :show, :create]
end
