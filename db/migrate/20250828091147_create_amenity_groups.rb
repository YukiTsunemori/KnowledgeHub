class CreateAmenityGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :amenity_groups do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
