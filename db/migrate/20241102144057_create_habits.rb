class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.datetime :notification_time

      t.timestamps
    end
  end
end
