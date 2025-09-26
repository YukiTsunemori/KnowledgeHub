class RemoveColumnFromRoomList < ActiveRecord::Migration[8.0]
  def up
    remove_column :room_lists, :embedding, :vector, limit: 1536
    remove_column :room_lists, :chunk, :text
  end
end
