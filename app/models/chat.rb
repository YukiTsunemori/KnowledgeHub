class Chat < ApplicationRecord
  acts_as_chat
  broadcasts_to ->(chat) { [ chat, "messages" ] }
end
