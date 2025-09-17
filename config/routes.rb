Rails.application.routes.draw do
  get "facilities/new"
  get "facilities/show"
  get "configurations/index", to: "configurations#index"
  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords"}

  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
  end
    resource :room_categories
    resource :amenity_groups
    resource :room_lists
    resource :facilities
end
