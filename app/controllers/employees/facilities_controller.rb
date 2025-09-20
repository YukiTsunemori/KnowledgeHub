class Employees::FacilitiesController < Employees::ApplicationController
  def new
    @facility = Facility.new
    @facilities = Facility.default_ordder
  end

  def create
    @facility = Facility.new(facility_parameter)
    if @facility.save
      redirect_to new_employees_facility_path, notice: '施設情報は無事作成されました。'
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def facility_parameter
    params.require(:facility).permit(:name, :close_time, :open_time, :note)
  end
end
