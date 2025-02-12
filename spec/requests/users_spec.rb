require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /users/:id" do
    it "ユーザー詳細ページにアクセスできる" do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /users/:id" do
    it "ユーザー情報を更新できる" do
      patch user_path(user), params: { user: { username: "UpdatedName" } }
      user.reload
      expect(user.username).to eq("UpdatedName")
    end
  end

  describe "POST /users/:id/follow" do
    it "フォローできる" do
      referer = user_path(other_user) # フォローするページ
      post follow_user_path(other_user), headers: { "HTTP_REFERER" => referer }
      
      expect(response).to redirect_to(referer) # request.referer にリダイレクトすることを確認
      expect(user.following?(other_user)).to be_truthy
    end
  end

  describe "DELETE /users/:id/unfollow" do
    before do
      user.follow(other_user)
    end

    it "フォローを解除できる" do
      referer = user_path(other_user) # フォロー解除するページ
      delete unfollow_user_path(other_user), headers: { "HTTP_REFERER" => referer }

      expect(response).to redirect_to(referer) # request.referer にリダイレクトすることを確認
      expect(user.following?(other_user)).to be_falsy
    end
  end
end
