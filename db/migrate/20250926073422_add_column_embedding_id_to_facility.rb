class AddColumnEmbeddingIdToFacility < ActiveRecord::Migration[8.0]
  def change
    add_reference :facilities, :knowledge_chunk, foreign_key: true
  end
end
