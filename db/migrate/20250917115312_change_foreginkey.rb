class ChangeForeginkey < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :chats, :users
    add_foreign_key :chats, :employees, column: :employee_id
  end
end
