class Employees::AccountsController < Employees::ApplicationController
  before_action :set_employee, only: %i[edit update]

  def edit; end

  def update
    if @employee.update_with_password(employee_params)
      redirect_to edit_employees_account_path, notice: "アカウント更新しました"
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def employee_params
    params.expect(employee: %i[email password password_confirmation current_password])
  end

  def set_employee
    @employee = current_employee
  end
end
