class AddColumnEmbeddingIdToRoomList < ActiveRecord::Migration[8.0]
  def change
    add_reference :room_lists, :knowledge_chunk, foreign_key: true
  end
end
