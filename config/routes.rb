Rails.application.routes.draw do
  root "chats#index"
  devise_for :employees, controllers: { sessions: "employees/sessions", passwords: "employees/passwords" }
  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" }

  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
    resources :employees
  end

  namespace :employees do
    root to: "configurations#index"
    resources :configurations, only: %i[index]
  end
  resources :room_categories
  resources :amenity_groups, only: %i[new create edit update destroy]
  resources :room_lists
  resources :facilities, only: %i[new create]

  resources :chats, only: [ :index, :new, :create, :show ] do
  resources :messages, only: [ :create ]
  end
end
