class ChangeNotificationTimeToTime < ActiveRecord::Migration[7.0]
  def change
    change_column :habits, :notification_time, :time
  end
end
