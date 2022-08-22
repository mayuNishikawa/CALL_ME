class CreatePost < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.text :image
      t.references :user, null: false, foreign_key: true
    end
  end
end
