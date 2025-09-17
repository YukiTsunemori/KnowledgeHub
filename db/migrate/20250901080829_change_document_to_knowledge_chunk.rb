class ChangeDocumentToKnowledgeChunk < ActiveRecord::Migration[8.0]
  def change
    rename_table :documents, :knowledge_chunks
  end
end
