class ChangeColumnEmployeeToChats < ActiveRecord::Migration[8.0]
  def change
    rename_column :chats, :user_id, :employee_id
  end
end
