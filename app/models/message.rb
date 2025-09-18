class Message < ApplicationRecord
  acts_as_message
  validates :role, presence: true
  validates :chat, presence: true
  broadcasts_to ->(message) { [ message.chat, "messages" ] }
  after_create_commit -> { broadcast_append_to("messages", target: "conversation-log", partial: "messages/message", locals: { message: self, broadcast: true }) }

  # Helper to broadcast chunks during streaming
  def broadcast_append_chunk(chunk_content)
    broadcast_append_to ->(message) { [ message.chat, "messages" ] }, # Target the stream
      target: "conversation-log", # Target the content div inside the message frame
      html: chunk_content # Append the raw chunk
  end
end
