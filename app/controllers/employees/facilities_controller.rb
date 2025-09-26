class Employees::FacilitiesController < Employees::ApplicationController
  def new
    @facility = Facility.new
    @facilities = Facility.default_ordder
  end

  def create
    @facility = Facility.new(facility_parameter)
    if @facility.save
      EmbeddingService.create_for_facilities(@facility)
      @facility.update!(knowledge_chunk_id: KnowledgeChunk.last.id)
      redirect_to new_employees_facility_path,
      notice: "施設情報「#{@facility.name}」は無事作成されました。"
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update(facility_parameter)
      redirect_to new_employees_facility_path, notice: "施設情報は無事更新されました。"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to new_employees_facility_path, notice: "施設情報「#{@facility.name}」は無事削除されました。", status: :see_other
  end

  private

  def facility_parameter
    params.require(:facility).permit(:name, :close_time, :open_time, :note)
  end
end
