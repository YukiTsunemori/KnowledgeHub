class RagService
  def self.answer(chat_id, query)
    chat = Chat.find(chat_id)
    thinking = true

    chunks = VectorSearch.search_by_similarity(query, limit: 5)
    context = chunks.map(&:content).join("\n---\n")
    prompt = <<~PROMPT
      以下のホテル情報を参考にして、ユーザーの質問に答えてください。
      コンテキスト:
      #{context}

      ユーザーの質問:
      #{query}
    PROMPT

    chat.ask(prompt) do |chunk|
      if thinking && chunk.content.present?
        thinking = false
        Turbo::StreamsChannel.broadcast_append_to(
          "chat_#{chat.id}",
          target: "conversation-log",
          partial: "messages/message",
          locals: { message: chat.messages.last }
        )
      end

      Turbo::StreamsChannel.broadcast_append_to(
        "chat_#{chat.id}",
        target: "message_#{chat.messages.last.id}_content",
        html: ActionController::Base.helpers.simple_format(chunk.content)
      )
    end
  end
end
