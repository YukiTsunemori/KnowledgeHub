class Admins::EmployeesController < Admins::ApplicationController
  before_action :set_employee, only: %i[show]

  def show; end

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

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.expect(employee: %i[name email password password_confirmation])
  end
end
