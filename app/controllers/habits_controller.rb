class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit, only: [:show, :edit, :update, :destroy]

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

  def show; end

  def edit; end

  def update
    if @habit.update(habit_params)
      redirect_to @habit, notice: '習慣が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy
    redirect_to habits_path, notice: '習慣が削除されました。'
  end

  private

  def set_habit
    @habit = Habit.find_by(id: params[:id])
    if @habit.nil?
      redirect_to habits_path, alert: '指定された習慣は見つかりませんでした。'
    end
  end

  def habit_params
    params.require(:habit).permit(:habit_name, :description, :start_date, :end_date, :notification_time, notification_days: [] )
  end
end
