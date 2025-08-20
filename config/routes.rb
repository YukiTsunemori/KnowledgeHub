Rails.application.routes.draw do
  devise_for :employees
  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords"}

  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
