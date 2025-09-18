class ConfigurationsController < ApplicationController
  # before_action :authenticate_admin!
  before_action :authenticate_employee!
  def index
  end
end
