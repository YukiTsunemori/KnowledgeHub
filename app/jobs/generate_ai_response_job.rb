class GenerateAiResponseJob < ApplicationJob
  queue_as :default

  def perform(chat_id, user_message)
    chat = Chat.find(chat_id)

    thinking = true

    chat.ask(user_message) do |chunk|
      if thinking && chunk.content.present?
        thinking = false
        Turbo::StreamsChannel.broadcast_append_to("chat_#{chat.id}", target: "conversation-log", partial: "messages/message", locals: { message: chat.messages.last })
      end

      Turbo::StreamsChannel.broadcast_append_to(
        "chat_#{chat.id}",
        target: "message_#{chat.messages.last.id}_content",
        html: chunk.content
      )
    end
  end
end
