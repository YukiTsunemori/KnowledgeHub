class ChangeForeginkey < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :chats, :employees, column: :employee_id
  end
end
