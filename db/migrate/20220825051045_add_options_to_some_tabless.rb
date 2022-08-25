class AddOptionsToSomeTabless < ActiveRecord::Migration[6.0]
  def up
    change_column :nicknames, :content, :string, null: false
    change_column :nicknames, :category, :string, null: false
    change_column :teams, :name, :string, null: false
    change_column :teams, :owner_id, :integer, null: false
    change_column :posts, :content, :string, null: false
    change_column :comments, :comment, :text, null: false
  end

  def down
    change_column :nicknames, :content, :string
    change_column :nicknames, :category, :string
    change_column :teams, :name, :string
    change_column :teams, :owner_id, :integer
    change_column :posts, :content, :string
    change_column :comments, :comment, :text
  end
end
