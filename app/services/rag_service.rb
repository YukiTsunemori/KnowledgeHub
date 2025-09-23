class RagService
  def self.answer(chat_id, query)
    chat = Chat.find(chat_id)

    user_message = chat.messages.create!(role: :user, content: query)
    chunks = VectorSearch.search_by_similarity(query, limit: 5)
    context = chunks.map(&:content).join("\n---\n")
    prompt_full = <<~PROMPT
      以下のホテル情報を参考にして、ユーザーの質問に答えてください。
      コンテキスト: #{context}
      ユーザーの質問: #{query}
    PROMPT

    llm_chat = RubyLLM.chat
    full_response = +""
    thinking = true

    llm_chat.ask(prompt_full) do |chunk|
      if chunk.content.present?
        full_response << chunk.content

        if thinking
          thinking = false
          Turbo::StreamsChannel.broadcast_append_to(
            "chat_#{chat.id}",
            target: "conversation-log",
            partial: "employees/messages/message",
            locals: { message: user_message }
          )
        end

        Turbo::StreamsChannel.broadcast_append_to(
          "chat_#{chat.id}",
          target: "message_#{user_message.id}_content",
          html: ActionController::Base.helpers.simple_format(chunk.content)
        )
      end
    end

    chat.messages.create!(role: :assistant, content: full_response)
  end
end
