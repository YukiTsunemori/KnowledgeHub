Rails.application.routes.draw do
  root "chats#index"
  get "configurations/index", to: "configurations#index"
  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" }

  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
  end
  resource :room_categories
  resource :amenity_groups
  resource :room_lists

  resources :chats, only: [ :index, :new, :create, :show ] do
  resources :messages, only: [ :create ]
  end
end
