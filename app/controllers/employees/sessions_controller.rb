class Employees::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    employees_root_path
  end

  def after_sign_out_path_for(resource)
    new_employee_session_path
  end
end
