class RagService
  def self.answer(query)
    # 類似チャンク検索
    chunks = VectorSearch.search_by_similarity(query, limit: 5)

    # コンテキスト生成
    context = chunks.map(&:content).join("\n---\n")
    prompt = <<~PROMPT
      以下のホテル情報を参考にして、ユーザーの質問に答えてください。
      コンテキスト:
      #{context}

      質問:
      #{query}
    PROMPT

    # chat.ask を使って質問→回答
    chat = RubyLLM.chat
    response = chat.ask(prompt)

    # AIからの回答テキストを返す
    puts response.content
  end
end
