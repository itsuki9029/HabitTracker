class ChangeNotificationDaysToJsonb < ActiveRecord::Migration[7.0]
  def change
    change_column :habits, :notification_days, :jsonb, using: 'notification_days::jsonb'
  end
end
