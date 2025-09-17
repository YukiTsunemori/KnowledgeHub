class VectorSearch
  def self.search_by_similarity(query_text, limit: 5)
    query_embedding = RubyLLM.embed(query_text, dimensions: 1536).vectors
    KnowledgeChunk.nearest_neighbors(:embedding, query_embedding, distance: :cosine).limit(limit)
  end
end
