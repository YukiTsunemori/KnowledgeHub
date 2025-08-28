class CreateRoomCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :room_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
