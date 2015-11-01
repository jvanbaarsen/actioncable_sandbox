class ChatsController < ApplicationController
  def index
    @chats = Chat.all.order(created_at: :desc)
  end

  def create
    @chat = Chat.create(chat_params)
    ActionCable.server.broadcast "chat",
      action: "new",
      message: ChatsController.render(partial: 'chats/chat', locals: { chat: @chat })
  end

  def destroy
    chat = Chat.find(params[:id])
    chat.destroy!
    ActionCable.server.broadcast "chat",
      action: "remove",
      message: chat.id
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
