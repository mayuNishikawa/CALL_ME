class ChatsController < ApplicationController
  def create
    @chat = current_user.chats.create!(chat_params)
  end

  private
  def chat_params
    params.require(:chat).permit(:content)
  end
end
