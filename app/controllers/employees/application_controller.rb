class Employees::ApplicationController < ApplicationController
  before_action :authenticate_employee!
  layout "employee_application"
end
