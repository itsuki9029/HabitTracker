class SetDefaultForNotificationDays < ActiveRecord::Migration[7.0]
  def change
    change_column_default :habits, :notification_days, []
  end
end
