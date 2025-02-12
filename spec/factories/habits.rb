FactoryBot.define do
  factory :habit do
    habit_name { "Test Habit" }
    description { "テスト" }
    start_date { Date.today }
    end_date { Date.today + 7.days }
    notification_time { Time.current }
    association :user
  end
end
