class LikesController < ApplicationController
    before_action :authenticate_user!

  def create
    habit = Habit.find(params[:habit_id])
    like = current_user.likes.new(habit_id: habit.id)

    respond_to do |format|
      if like.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("habit_#{habit.id}_like", partial: 'habits/like', locals: { habit: habit })
        end
      else
        format.html { redirect_to habit, alert: 'Failed to like.' }
      end
    end
  end

  def destroy
    like = current_user.likes.find_by(habit_id: params[:habit_id])
    habit = Habit.find(params[:habit_id])

    respond_to do |format|
      if like&.destroy
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("habit_#{habit.id}_like", partial: 'habits/like', locals: { habit: habit })
        end
      else
        format.html { redirect_to habit, alert: 'Failed to unlike.' }
      end
    end
  end
end
