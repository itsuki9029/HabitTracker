class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :habit_id], unique: true
  end
end
