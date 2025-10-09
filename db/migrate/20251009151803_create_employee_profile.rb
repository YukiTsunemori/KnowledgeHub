class CreateEmployeeProfile < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.references :employee, null: false, foreign_key: true, index: true
      t.string :nickname, null: false
      t.date :birthday, null: false
      t.string :living_location
      t.string :hometown
      t.text :interest
      t.text :bio

      t.timestamps
    end
  end
end
