class CommentsController < ApplicationController
  before_action :set_habit
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def create
    @comment = @habit.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to habit_path(@habit), notice: 'コメントを投稿しました。'
    else
      redirect_to habit_path(@habit), alert: 'コメントの投稿に失敗しました。'
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to habit_path(@habit), notice: 'コメントを更新しました。'
    else
      redirect_to habit_path(@habit), alert: 'コメントの更新に失敗しました。'
    end
  end

  def destroy
    @comment.destroy
    redirect_to habit_path(@habit), notice: 'コメントを削除しました。'
  end

  private

  def set_habit
    @habit = Habit.find(params[:habit_id])
  end

  def set_comment
    @comment = @habit.comments.find(params[:id])
  end

  def authorize_user
    unless @comment.user == current_user
      redirect_to habit_path(@habit), alert: 'この操作は許可されていません。'
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
