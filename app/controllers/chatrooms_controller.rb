class ChatroomsController < ApplicationController
  def show
    @chats = Chat.includes(:user).order(:id)
    @chat = current_user.messages.build
  end
end
