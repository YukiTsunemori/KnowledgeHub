class Message < ApplicationRecord
  acts_as_message
  validates :role, presence: true
  validates :chat, presence: true
  broadcasts_to ->(message) { [ message.chat, "messages" ] }
end
