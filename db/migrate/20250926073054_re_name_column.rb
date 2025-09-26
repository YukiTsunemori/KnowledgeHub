class ReNameColumn < ActiveRecord::Migration[8.0]
  def change
    rename_column :room_categories, :knowledge_chunks_id, :knowledge_chunk_id
  end
end
