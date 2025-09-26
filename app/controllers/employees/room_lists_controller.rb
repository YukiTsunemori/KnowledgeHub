class Employees::RoomListsController < Employees::ApplicationController
  def new
    @room = RoomList.new
    @room_lists = RoomList.default_order
  end

  def create
    @room = RoomList.new(room_list_parameter)
    if @room.save
      EmbeddingService.create_for_roomlists(@room)
      @room.update!(knowledge_chunk_id: KnowledgeChunk.last.id)
      redirect_to new_employees_room_list_path,
      notice: "ルーム情報「#{@room.room_type_name}」は無事作成されました。"
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @roomlist = RoomList.find(params[:id])
  end

  def update
    @edit_room_list = RoomList.find(params[:id])
    if @edit_room_list.update(room_list_parameter)
      EmbeddingService.update_for_room_lists(@edit_room_list)
      redirect_to new_employees_room_list_path, notice: "ルーム情報を更新しました。"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @room = RoomList.find(params[:id])
    @room.destroy
    knowledge_chunk = KnowledgeChunk.find_by(id: @room.knowledge_chunk_id)
    knowledge_chunk.destroy
    redirect_to new_employees_room_list_path, notice: "ルーム情報「#{@room.room_type_name}」は無事削除されました。"
  end

  private

  def room_list_parameter
    params.require(:room_list).permit(:room_type_name, :square_meters, :capacity, :bed_type, :bed_quantity, :htwn, :room_category_id, :amenity_group_id, :knowledge_chunk_id)
  end
end
