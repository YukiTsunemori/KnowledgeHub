class Employees::MessagesController < Employees::ApplicationController
  def create
    @chat = find_chat
    RagService.answer(@chat.id, message_params[:content])
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to employees_chat_path(@chat) }
    end
  end

  private

  def find_chat
    current_employee.chats.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
