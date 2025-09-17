class FacilitiesController < ApplicationController
  def new
    @facilities = Facility.new
  end

  def create
    @facilities = Facility.new(facility_parameter)
    if @facilities.save
      redirect_to new_facilities_path, notice: '施設情報は無事作成されました。'
    else
      render :new, status: :unprocessable_content
    end
  end

  def show
    @facilities = Facility.find(params[:id])
  end

  private 
  def facility_parameter
    params.require(:facility).permit(:name, :close_time, :open_time, :note)
  end
end
