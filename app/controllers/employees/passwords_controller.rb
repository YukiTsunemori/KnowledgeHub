class Employees::PasswordsController < Devise::PasswordsController
  def after_resetting_password_path_for(resource)
    employees_root_path
  end
end
