class KnowledgeChunk < ApplicationRecord
  has_neighbors :embedding
  # validates :content, presence: true
  # validates :embedding, presence: true
  # validates :title, presence: true

  # before_save :EmbeddingService.create_for_roomlists, if: :content_changed?
  # 生成された新しいembeddingがあれば再度生成を実行するもの。

  # scope :search_by_similarity, ->(query_text, limit: 5) {
  #   query_embedding = RubyLLM.embed(query_text, dimensions: 1536).vectors
  #   nearest_neighbors(:embedding, query_embedding, distance: :cosine).limit(limit)
  # }
  # これら検索scopeは別ファイル(VectorSearch)で定義することとする。

end
