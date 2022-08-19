class AddTeamRefToChats < ActiveRecord::Migration[6.0]
  def change
    add_reference :chats, :team, foreign_key: true
  end
end
