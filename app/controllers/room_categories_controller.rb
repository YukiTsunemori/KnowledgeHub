class RoomCategoriesController < ApplicationController
  def new
    @category_all = RoomCategory.default_order
    @room_category = RoomCategory.new
  end

  def create
    @room_category = RoomCategory.new(room_category_params)
    @category_all = RoomCategory.default_order

    if @room_category.save
      EmbeddingService.create_for_roomcategory(@room_category)
      redirect_to new_room_category_path,
      notice: "ルームカテゴリー「#{@room_category.name}」は無事作成されました。"
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @edit_room_category = RoomCategory.find(params[:id])
  end

  def update
    @edit_room_category = RoomCategory.find(params[:id])
    if @edit_room_category.update(room_category_params)
      redirect_to new_room_category_path, notice: "ルームカテゴリーを更新しました。"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @delete_room_category = RoomCategory.find(params[:id])
    @delete_room_category.destroy
    redirect_to new_room_category_path, status: :see_other
  end

  private

  def room_category_params
    params.require(:room_category).permit(:name)
  end
end
