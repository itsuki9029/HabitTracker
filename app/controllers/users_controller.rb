class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :follow, :unfollow, :index, :followers, :following]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  def follow
    current_user.follow(@user)
    redirect_to request.referer, notice: 'フォローしました'
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to request.referer, notice: 'フォローを解除しました'
  end

  # フォロワー一覧を表示
  def followers
    @q = User.where.not(id: current_user.id).ransack(params[:q])
    @search_results = params[:q].present? ? @q.result(distinct: true) : []  # 検索フォームが空なら結果を空に
    @followers = @user.followers.where.not(id: current_user.id)  # フォロワーリストをデフォルトで表示
  end

  # フォローしているユーザー一覧を表示
  def following
    @q = User.where.not(id: current_user.id).ransack(params[:q])
    @search_results = params[:q].present? ? @q.result(distinct: true) : []  # 検索フォームが空なら結果を空に
    @following = @user.following.where.not(id: current_user.id)  # フォローしているユーザーリストをデフォルトで表示
  end

  def index; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :profile_image)
  end
end
