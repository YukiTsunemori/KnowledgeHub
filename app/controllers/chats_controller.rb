class ChatsController < ApplicationController
  def index
    @chats = chat_scope
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

  # private
  # def chat_scope
  #   Current.user.chats
  # end
  # ユーザーと紐づける際のメソッド
end
