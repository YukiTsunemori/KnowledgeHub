class Admins::PasswordsController < Devise::PasswordsController
  def after_resetting_password_path_for(resource)
    admins_root_path
  end
end
