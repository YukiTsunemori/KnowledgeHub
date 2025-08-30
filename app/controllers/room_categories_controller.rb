class RoomCategoriesController < ApplicationController
  def index
  end

  def new
    @category_all = RoomCategory.all
    @room_category = RoomCategory.new
  end

  def create
    @room_category = RoomCategory.new(room_category_params)
    @category_all = RoomCategory.all
    # binding.irb
    if @room_category.save
      redirect_to new_room_categories_path, notice: "ルームカテゴリーは無事作成されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

    def room_category_params
      params.require(:room_category).permit(:name)
    end
end
