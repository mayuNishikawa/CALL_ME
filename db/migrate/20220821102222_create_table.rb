class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :content, null: false
      t.text :image
      t.references :user, null: false, foreign_key: true

    end
  end
end
