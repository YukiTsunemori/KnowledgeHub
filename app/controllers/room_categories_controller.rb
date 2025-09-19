class RoomCategoriesController < ApplicationController
  def new
    @category_all = RoomCategory.all
    @room_category = RoomCategory.new
  end

  def create
    @room_category = RoomCategory.new(room_category_params)
    @category_all = RoomCategory.all
    # binding.irb
    if @room_category.save
      EmbeddingService.create_for_roomcategory(@room_category)
      redirect_to new_room_category_path,
      notice: "ルームカテゴリー「#{@room_category.name}」は無事作成されました。"
    else
      render :new, status: :unprocessable_content
    end
  end

  def show
  end

  private

    def room_category_params
      params.require(:room_category).permit(:name)
    end
end
