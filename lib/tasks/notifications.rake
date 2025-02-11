namespace :notifications do
  desc "送信時間になった習慣を LINE に通知"
  task send: :environment do
    current_time = Time.current.in_time_zone('Asia/Tokyo')
    current_day = current_time.strftime("%A")
    target_time = current_time.strftime("%H:%M")

    habits = Habit.where("notification_days @> ?", [current_day].to_json)
                  .where("to_char(notification_time, 'HH24:MI') = ?", target_time)

    habits.each do |habit|
      user = habit.user
      next unless user&.uid

      message = "#{habit.habit_name} の時間です！継続できるようがんばりましょう💪"
      LineBotClient.push_message(user.uid, message)
    end
  end
end
