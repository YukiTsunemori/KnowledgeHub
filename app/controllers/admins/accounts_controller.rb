class Admins::AccountsController < Admins::ApplicationController
  before_action :set_admin, only: %i[edit update]

  def edit; end

  def update
    if @admin.update_with_password(admin_params)
      redirect_to edit_admins_account_path, notice: "アカウント更新しました"
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def admin_params
    params.expect(admin: %i[email password password_confirmation current_password])
  end

  def set_admin
    @admin = current_admin
  end
end
