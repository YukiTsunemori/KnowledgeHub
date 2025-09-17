class AddColumnToFacility < ActiveRecord::Migration[8.0]
  def change
    add_column :facilities, :open_time, :time
  end
end
