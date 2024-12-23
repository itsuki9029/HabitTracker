class AddNotificationDaysAndTimeToHabits < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :notification_days, :json
  end
end
