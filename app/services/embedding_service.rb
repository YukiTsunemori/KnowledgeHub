class EmbeddingService
  def self.create_for_roomlists(room)
    content = ChunkGenerator.roomlists_chunk(room)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
    KnowledgeChunk.last.id
  end

  def self.create_for_roomcategory(category)
    content = ChunkGenerator.roomcategories_chunk(category)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
    KnowledgeChunk.last.id
  end

  def self.create_for_amenitygroups(amenity)
    content = ChunkGenerator.amenitygroups_chunk(amenity)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
    KnowledgeChunk.last.id
  end

  def self.create_for_facilities(facility)
    content = ChunkGenerator.facilities_chunk(facility)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
    KnowledgeChunk.last.id
  end
end
