import { createConsumer } from "@rails/actioncable"

export default createConsumer()


// app/javascipt/channels/chat_channel.js
import consumer from "./consumer"

consumer.subscriptions.create(
  { channel: "ChatChannel", id: this.element.dataset.chatId }
)