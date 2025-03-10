class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @habits = Habit.tagged_with(params[:tag]).order(created_at: :desc)
    else
      @habits = Habit.all.order(created_at: :desc)
    end
  end

  def new
    @habit = current_user.habits.build
  end

  def create
    @habit = current_user.habits.build(habit_params)
    if @habit.save
      redirect_to habits_path, notice: '習慣が作成されました。'
    else
      Rails.logger.debug @habit.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @encouragement = EncouragementService.get_message(@habit.habit_name)
  end

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
    params.require(:habit).permit(:habit_name, :description, :start_date, :end_date, :tag_list, :notification_time, notification_days: [])
  end
end
