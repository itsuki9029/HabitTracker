class HabitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @habits = Habit.all
  end

  def new
    @habit = current_user.habits.build
  end

  def create
    @habit = current_user.habits.build(habit_params)
    if @habit.save
      redirect_to habits_path, notice: '習慣が作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:habit_name, :description, :start_date, :end_date)
  end
end
