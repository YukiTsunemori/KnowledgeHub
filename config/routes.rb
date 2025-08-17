Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', passwords: 'admins/passwords'}

  get "up" => "rails/health#show", as: :rails_health_check
  namespace :admins do
    root to: "home#index"
    resource :account, only: %i[edit update]
  end
end
