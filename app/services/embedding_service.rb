class EmbeddingService
  def self.create_for_roomlists(room)
    content = ChunkGenerator.roomlists_chunk(room)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
    # content = ChunkGenerator.roomlists_chunk(room)
    # embedding = RubyLLM.embed(content, dimensions: 1536).vectors
    # knowledge_chunk = KnowledgeChunk.find_or_initialize_by(id: room.id)
    # knowledge_chunk.content = content
    # knowledge_chunk.embedding = embedding
    # knowledge_chunk.save
    # TODO: ポリモーフィックを調べて、knowledge_chunkにカラムを追加する。idとテーブル名を入れる。
  end

  def self.create_for_roomcategory(category)
    content = ChunkGenerator.roomcategories_chunk(category)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
  end

  def self.create_for_amenitygroups(amenity)
    content = ChunkGenerator.amenitygroups_chunk(amenity)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
  end

  def self.create_for_facilities(facility)
    content = ChunkGenerator.amenitygroups_chunk(facility)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors

    KnowledgeChunk.create!(
      content: content,
      embedding: embedding
    )
  end
end
