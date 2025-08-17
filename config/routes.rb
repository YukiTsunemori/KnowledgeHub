Rails.application.routes.draw do
  devise_for :admins

  get "up" => "rails/health#show", as: :rails_health_check
end
