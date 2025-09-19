class ChatsController < ApplicationController
  before_action :authenticate_employee!
  def index
    @chats = chat_scope.order(id: :desc)
  end

  def create
    @chat = chat_scope.new

    if @chat.save
      redirect_to @chat
    else
      render :index, status: :unprocessable_entity

    end
  end

  def show
    @chat = chat_scope.find(params[:id])
  end

  private

  def chat_scope
    current_employee.chats
  end
end
