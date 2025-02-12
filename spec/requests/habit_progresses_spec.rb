require 'rails_helper'

RSpec.describe "HabitProgresses", type: :request do
  let(:user) { create(:user) }
  let(:habit) { create(:habit, user: user) }
  let(:progress) { habit.progress_for_today(user) }

  before do
    sign_in user
  end

  describe "PATCH /habits/:id/toggle_progress" do
    it "チェックボックスの状態を切り替えられる" do
      expect(progress.checked).to be_falsey

      patch toggle_progress_habit_path(habit), params: { checked: true }, as: :json
      expect(response).to have_http_status(:ok)

      progress.reload
      expect(progress.checked).to be_truthy
    end
  end
end
