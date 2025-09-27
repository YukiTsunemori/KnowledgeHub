class Employees::AmenityGroupsController < Employees::ApplicationController
  def new
    @group_all = AmenityGroup.default_order
    @amenity_group = AmenityGroup.new
  end

  def create
    @amenity_group = AmenityGroup.new(amenity_group_params)
    @group_all = AmenityGroup.default_order

    if @amenity_group.save
      CreateEmbeddingService.create_for_amenitygroups(@amenity_group)
      @amenity_group.update!(knowledge_chunk_id: KnowledgeChunk.last.id)
      redirect_to new_employees_amenity_group_path,
      notice: "アメニティーグループ「#{@amenity_group.name}」は無事作成されました。"
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @edit_amenity_group = AmenityGroup.find(params[:id])
  end

  def update
    @edit_amenity_group = AmenityGroup.find(params[:id])
    if @edit_amenity_group.update(amenity_group_params)
      UpdateEmbeddingService.update_for_amenity_groups(@edit_amenity_group)
      redirect_to new_employees_amenity_group_path, notice: "アメニティーグループを更新しました。"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @amenity_group = AmenityGroup.find(params[:id])
    @amenity_group.destroy
    knowledge_chunk = KnowledgeChunk.find_by(id: @amenity_group.knowledge_chunk_id)
    knowledge_chunk.destroy
    redirect_to new_employees_amenity_group_path, notice: "アメニティーグループ「#{@amenity_group.name}」は無事削除されました。"
  end

  private

  def amenity_group_params
    params.require(:amenity_group).permit(:name, :content)
  end
end
