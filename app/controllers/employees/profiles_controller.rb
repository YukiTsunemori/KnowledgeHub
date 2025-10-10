class Employees::ProfilesController < Employees::ApplicationController
  def show
    @profile = current_employee.profile
  end

  def new
    @profile = current_employee.profile || current_employee.build_profile
  end

  def create
    @profile = current_employee.build_profile(profile_params)

    if @profile.save
      redirect_to employees_profile_path, notice: "プロフィールを登録しました"
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def profile_params
    params.expect(profile: %i[nickname birthday living_location hometown interest bio])
  end
end
