class RoomListsController < ApplicationController
  def new
    @categories = RoomCategory.all
    @amenities = AmenityGroup.all
    @room = RoomList.new
  end

  def create
    @room = RoomList.new(room_list_parameter)
    if @room.save
      redirect_to new_room_lists_path, notice: 'ルーム情報は無事作成されました。'
    else
      render :new, status: :unprocessable_content
    end
  end

  def show
  end

  private
    def room_list_parameter
      params.require(:room_list).permit(:room_type_name, :square_meters, :capacity, :bed_type, :bed_quantity, :htwn, :room_category_id, :amenity_group_id)
    end
end
