class UpdateEmbeddingService
  def self.update_for_room_lists(edit_room_list)
    content = ChunkGenerator.roomlists_chunk(edit_room_list)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors
      update_knowledge_chunk = KnowledgeChunk.find_by(id: edit_room_list.knowledge_chunk_id)
      update_knowledge_chunk.update(
      content: content,
      embedding: embedding
    )
  end

  def self.update_for_room_category(edit_room_category)
    content = ChunkGenerator.roomcategories_chunk(edit_room_category)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors
      update_knowledge_chunk = KnowledgeChunk.find_by(id: edit_room_category.knowledge_chunk_id)
      update_knowledge_chunk.update(
        content: content,
        embedding: embedding
      )
  end

  def self.update_for_amenity_groups(edit_amenity_group)
    content = ChunkGenerator.amenitygroups_chunk(edit_amenity_group)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors
      update_knowledge_chunk = KnowledgeChunk.find_by(id: edit_amenity_group.knowledge_chunk_id)
      update_knowledge_chunk.update(
        content: content,
        embedding: embedding
      )
  end

  def self.update_for_facility(facility)
    content = ChunkGenerator.facilities_chunk(facility)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors
    update_knowledge_chunk = KnowledgeChunk.find_by(id: facility.knowledge_chunk_id)
    update_knowledge_chunk.update(
      content: content,
      embedding: embedding
    )
  end
end
