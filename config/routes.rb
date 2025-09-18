Rails.application.routes.draw do
  root "chats#index"
  get "facilities/new"
  get "facilities/show"
  get "configurations/index", to: "configurations#index"
  devise_for :employees
  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" }
  

  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
    resources :employees
  end
  resource :room_categories
  resource :amenity_groups
  resource :room_lists
  resource :facilities

  resources :chats, only: [ :index, :new, :create, :show ] do
  resources :messages, only: [ :create ]
  end
end
