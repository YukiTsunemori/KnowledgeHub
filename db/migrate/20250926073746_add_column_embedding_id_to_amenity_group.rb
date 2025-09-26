class AddColumnEmbeddingIdToAmenityGroup < ActiveRecord::Migration[8.0]
  def change
    add_reference :amenity_groups, :knowledge_chunk, foreign_key: true
  end
end
