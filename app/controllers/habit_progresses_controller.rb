class HabitProgressesController < ApplicationController
  before_action :set_habit

  def toggle
    progress = @habit.progress_for_today(current_user)
    progress.update(checked: params[:checked])
    render json: { success: true }
  end

  private

  def set_habit
    @habit = Habit.find(params[:id])
  end
end
