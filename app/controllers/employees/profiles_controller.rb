class Employees::ProfilesController < Employees::ApplicationController
  def show
    @profile = current_employee.profile
  end

  def new
    @profile = current_employee.profile || current_employee.build_profile
  end
end
