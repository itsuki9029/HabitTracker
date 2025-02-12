require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  let(:habit) { create(:habit, user: user) }
  let(:like) { create(:like, user: user, habit: habit) }

  before do
    sign_in user
  end

  describe "POST /habits/:habit_id/like" do
    it "いいねを作成できる" do
      expect {
        post habit_likes_path(habit), as: :turbo_stream
      }.to change(Like, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /habits/:habit_id/unlike" do
    before do
      like
    end

    it "いいねを削除できる" do
      expect {
        delete habit_likes_path(habit), as: :turbo_stream
      }.to change(Like, :count).by(-1)
      expect(response).to have_http_status(:success)
    end
  end
end