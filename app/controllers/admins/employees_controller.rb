class Admins::EmployeesController < Admins::ApplicationController
  before_action :set_employee, only: %i[show destroy]

  def index
    @employees = Employee.default_order
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to admins_employee_path(@employee), notice: "従業員アカウントを登録しました"
    else
      render :new, status: :unprocessable_content
    end
  end

  def destroy
    @employee.destroy
    redirect_to admins_employees_path, status: :see_other, notice: "従業員アカウントを削除しました"
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.expect(employee: %i[name email password password_confirmation])
  end
end
