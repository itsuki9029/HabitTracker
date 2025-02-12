require 'rails_helper'

RSpec.describe "Habits", type: :request do
  let(:user) { create(:user) }
  let!(:habit) { create(:habit, user: user) }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "リクエストが成功する" do
      get habits_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "新しい習慣を作成する" do
      expect {
        post habits_path, params: { habit: attributes_for(:habit) }
      }.to change(Habit, :count).by(1)
      expect(response).to redirect_to(habits_path)
    end
  end

  describe "PATCH /update" do
    it "習慣を更新する" do
      patch habit_path(habit), params: { habit: { habit_name: "Updated Habit" } }
      habit.reload
      expect(habit.habit_name).to eq("Updated Habit")
    end
  end

  describe "DELETE /destroy" do
    it "習慣を削除する" do
      expect {
        delete habit_path(habit)
      }.to change(Habit, :count).by(-1)
    end
  end
end
