class AmenityGroupsController < ApplicationController
  def new
    @group_all = AmenityGroup.all
    @amenity_group = AmenityGroup.new
  end

  def create
    @amenity_group = AmenityGroup.new(amenity_group_params)
    @group_all = AmenityGroup.all

    if @amenity_group.save
      redirect_to new_amenity_groups_path, notice: "アメニティーグループは無事作成されました。"
    else
      render :new, status: :unprocessable_content
    end
  end

  def show
  end

  private
    def amenity_group_params
      params.require(:amenity_group).permit(:name, :content)
    end
end
