class EmbeddingService
  # ここから下はcreate用メソッド
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
  # create用メソッドはここまで

  # ここから下はupdate用のメソッド
  def self.update_for_room_lists(edit_room_list)
    content = ChunkGenerator.roomlists_chunk(edit_room_list)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors
      knowledge_chunk_id = KnowledgeChunk.find_by(id: edit_room_list.knowledge_chunk_id)
      knowledge_chunk_id.update(
      content: content,
      embedding: embedding
    )
  end

  def self.update_for_room_category(edit_room_category)
    content = ChunkGenerator.roomcategories_chunk(edit_room_category)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors
      knowledge_chunk_id = KnowledgeChunk.find_by(id: edit_room_category.knowledge_chunk_id)
      knowledge_chunk_id.update(
        content: content,
        embedding: embedding
      )
  end

  def self.update_for_amenity_groups(edit_amenity_group)
    content = ChunkGenerator.amenitygroups_chunk(edit_amenity_group)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors
      knowledge_chunk_id = KnowledgeChunk.find_by(id: edit_amenity_group.knowledge_chunk_id)
      knowledge_chunk_id.update(
        content: content,
        embedding: embedding
      )
  end

  def self.update_for_facility(facility)
    content = ChunkGenerator.facilities_chunk(facility)
    embedding = RubyLLM.embed(content, dimensions: 1536).vectors
    knowledge_chunk_id = KnowledgeChunk.find_by(id: facility.knowledge_chunk_id)
    knowledge_chunk_id.update(
      content: content,
      embedding: embedding
    )
  end
end
