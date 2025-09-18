class CreateFacilities < ActiveRecord::Migration[8.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.time :close_time
      t.text :note

      t.timestamps
    end
  end
end
