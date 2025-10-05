class ChangeColumnEmployeeToChats < ActiveRecord::Migration[8.0]
  def change
    # もし user_id がない場合は rename ではなく add_reference を使う
    unless column_exists?(:chats, :employee_id)
      add_reference :chats, :employee, foreign_key: true
    end
  end
end
