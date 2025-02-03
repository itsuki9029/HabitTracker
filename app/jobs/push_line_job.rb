require 'line/bot'

class PushLineJob < ApplicationJob
  queue_as :default

  def perform
    current_time = Time.current.in_time_zone('Asia/Tokyo')
    current_day = current_time.strftime("%A")
    target_time = current_time.strftime("%H:%M") + ":00"

    logger.info "Current day: #{current_day}"
    logger.info "Current time (JST): #{target_time}"

    # 通知する習慣を取得
    matching_habits = Habit.where("notification_days @> ?", [current_day].to_json)
                            .where("to_char(notification_time, 'HH24:MI:SS') = ?", target_time)

    logger.info "Matching habits: #{matching_habits.pluck(:habit_name)}"

    habits_to_notify.each do |habit|
      user = habit.user
      next unless user&.uid.present?

      message = {
        type: 'text',
        text: "「#{habit.habit_name}」の時間です！"
      }

      response = line_client.push_message(user.uid, message)
      if response.code.to_i == 200
        logger.info "PushLineSuccess for #{habit.habit_name} (User: #{user.uid})"
      else
        logger.error "PushLineFailed: #{response.body}"
      end
    end
  end

  private

  def line_client
    Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_ACCESS_TOKEN"]
    end
  end
end
