require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:habit) { create(:habit, user: user) }
  let(:valid_params) { { comment: { content: "テストコメント" } } }

  before do
    sign_in user
  end

  describe "POST /habits/:habit_id/comments" do
    it "コメントを投稿できる" do
      expect {
        post habit_comments_path(habit), params: valid_params
      }.to change(Comment, :count).by(1)
      expect(response).to redirect_to(habit_path(habit))
    end
  end
end
