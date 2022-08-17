class ChatsController < ApplicationController
  def create
    @chat = current_user.chats.create!(chat_params)
    ActionCable.server.broadcast('room_channel', {chat: @chat.template})
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
  end

  private
  def chat_params
    params.require(:chat).permit(:content)
  end
end
