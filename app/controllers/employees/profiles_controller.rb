class Employees::ProfilesController < Employees::ApplicationController
  before_action :set_profile, only: %i[edit update]

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

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to employees_profile_path, notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def profile_params
    params.expect(profile: %i[nickname birthday living_location hometown interest bio])
  end

  def set_profile
    @profile = current_employee.profile
  end
end
