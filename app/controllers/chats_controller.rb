class ChatsController < ApplicationController
  def new
    @chat = Chat.new
  end

  def create
    @chat = current_user.chats.create!(chat_params)
    SendChatJob.perform_later(@chat)
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
  end

  private
  def chat_params
    params.require(:chat).permit(:content, :user_id, :team_id)
  end
end
