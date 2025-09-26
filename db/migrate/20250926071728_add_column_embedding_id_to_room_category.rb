class AddColumnEmbeddingIdToRoomCategory < ActiveRecord::Migration[8.0]
  def change
    add_reference :room_categories, :knowledge_chunk, foreign_key: true
  end
end
