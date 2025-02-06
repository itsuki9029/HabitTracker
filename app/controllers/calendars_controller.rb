class CalendarsController < ApplicationController
  def show
    @habits = current_user.habits.includes(:habit_progresses)
    @start_date = params.permit(:start_date)[:start_date] || Date.today.to_s
    @progresses = HabitProgress.where(user: current_user, date: date_range)
                               .group_by(&:date)
                               .transform_values { |progresses| progresses.index_by(&:habit_id) }
  end

  private

  def date_range
    start_date = Date.parse(@start_date.to_s)
    (start_date.beginning_of_month..start_date.end_of_month)
  end
end
