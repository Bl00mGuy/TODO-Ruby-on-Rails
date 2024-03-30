Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :tasks
  resources :tags
  resources :sessions, only: [:new, :create, :destroy]
  # другие маршруты
end
