class CreateHabitProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_progresses do |t|
      t.references :habit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :checked, default: false
      t.date :date, null: false

      t.timestamps
    end

    add_index :habit_progresses, [:habit_id, :user_id, :date], unique: true
  end
end
