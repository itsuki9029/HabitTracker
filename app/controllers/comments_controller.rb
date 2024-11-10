class CommentsController < ApplicationController
  before_action :set_habit

  def create
    @comment = @habit.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'コメントが投稿されました。'
    else
      flash[:alert] = 'コメントの投稿に失敗しました。'
    end
    redirect_to habit_path(@habit)
  end

  private

  def set_habit
    @habit = Habit.find(params[:habit_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
