class Employees::MessagesController < Employees::ApplicationController
  def create
    @chat = find_chat
    RagService.answer(@chat.id, params[:message][:content])
    redirect_to @chat
  end

  private

  def find_chat
    current_employee.chats.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
