module ChatsHelper
  def chat_first_message(chat)
    chat.messages.present? ? chat.messages.first.content.truncate(9) :  "メッセージなし"
  end
end
