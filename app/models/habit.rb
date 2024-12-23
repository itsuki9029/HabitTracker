class Habit < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :habit_progresses, dependent: :destroy

  validates :habit_name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 100 }
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "は開始日より後の日付を選択してください")
    end
  end

  # 今日の進捗状況を取得
  def progress_for_today(user)
    habit_progresses.find_or_create_by(user: user, date: Date.current)
  end

  def self.notify_users
    day_mapping = {
      "Sunday" => "sunday", "Monday" => "monday", "Tuesday" => "tuesday",
      "Wednesday" => "wednesday", "Thursday" => "thursday", "Friday" => "friday", "Saturday" => "saturday"
    }

    current_time = Time.current
    current_day = day_mapping[current_time.strftime("%A")]
    current_hour = current_time.hour
    current_minute = current_time.min

    habits_to_notify = Habit.where("notification_days @> ?", [current_day].to_json)
                            .where(notification_time: "#{current_hour}:#{current_minute}")

    habits_to_notify.each do |habit|
      if habit.user.line_user_id.present?
        LineNotifier.push_message(habit.user.line_user_id, "「#{habit.habit_name}」の時間です！")
      end
    end
  end
end
