Rails.application.routes.draw do
  root "chats#index"
  devise_for :employees, controllers: { sessions: "employees/sessions" }
  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" }

  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
    resources :employees
  end

  namespace :employees do
    root to: "configurations#index"
  end
  resources :room_categories
  resources :amenity_groups
  resources :room_lists
  resources :facilities

  resources :chats, only: [ :index, :new, :create, :show ] do
  resources :messages, only: [ :create ]
  end
end
