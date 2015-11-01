# app/channels/appearance_channel.rb
class AppearanceChannel < ApplicationCable::Channel
  def connected
    chat = Chat.create(message: "User connected #{current_user}")
    ActionCable.server.broadcast "chat",
      message: ChatsController.render(partial: 'chats/chat', locals: { chat: chat })
  end
end
