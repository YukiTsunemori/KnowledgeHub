class EmbeddingService
  def self.create_for_roomlists(room)
    content = ChunkGenerator.roomlists_chunk(room)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
  end

  # def generate_embedding
  #   return if content.blank?
  #   puts "Generating embedding for Document #{id}..."
  #   begin
  #     embedding_result = RubyLLM.embed(content) # Uses default embedding model
  #     self.embedding = embedding_result.vectors
  #   rescue RubyLLM::Error => e
  #     errors.add(:base, "Failed to generate embedding: #{e.message}")
  #     # Prevent saving if embedding fails (optional, depending on requirements)
  #     throw :abort
  #   end
  # end
end
