Rails.application.routes.draw do
  root "chats#index"
  get "configurations/index", to: "configurations#index"
  devise_for :employees
  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" }

  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
    resources :employees
  end
  resources :room_categories
  resources :amenity_groups
  resources :room_lists
  resources :facilities

  resources :chats, only: [ :index, :new, :create, :show ] do
  resources :messages, only: [ :create ]
  end
end
