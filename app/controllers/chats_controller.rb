class ChatsController < ApplicationController
  def new
    Chat.new
  end

  def create
    @chat = current_user.chats.create(chat_params)
    SendChatJob.perform_later(@chat)
  end

  private
  
  def chat_params
    params.require(:chat).permit(:content, :user_id, :team_id)
  end
end
