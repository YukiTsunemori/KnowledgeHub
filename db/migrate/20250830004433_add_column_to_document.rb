class AddColumnToDocument < ActiveRecord::Migration[8.0]
  def change
    add_column :documents, :title, :string
    add_column :documents, :content, :text
  end
end
