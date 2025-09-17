class CreateChatBots < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_bots do |t|
      t.string :text
      t.timestamps
    end
  end
end
