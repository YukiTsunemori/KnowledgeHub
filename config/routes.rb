Rails.application.routes.draw do
  devise_for :employees
  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords" }
  get "configurations/index", to: "configurations#index"


  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
    resources :employees
  end
    resource :room_categories
    resource :amenity_groups
    resource :room_lists
end
