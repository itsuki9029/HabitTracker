class AddLineRegisteredToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :line_registered, :boolean, default: false, null: false
  end
end
