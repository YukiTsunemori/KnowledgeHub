class CreateRoomLists < ActiveRecord::Migration[8.0]
  def change
    create_table :room_lists do |t|
      t.string :room_type_name
      t.integer :square_meters
      t.integer :capacity
      t.string :bed_type
      t.integer :bed_quantity
      t.boolean :htwn
      t.references :room_category, null: false, foreign_key: true
      t.references :amenity_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
