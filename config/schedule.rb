every 1.day, at: '0:00 am' do
  runner "HabitProgress.where(date: Date.current).update_all(checked: false)"
end

every 1.minute do
  runner "PushLineJob.perform_later"
end
