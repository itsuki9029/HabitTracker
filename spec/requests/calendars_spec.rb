require 'rails_helper'

RSpec.describe "Calendars", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /calendar" do
    it "カレンダー画面に正常にアクセスできる" do
      get calendar_path
      expect(response).to have_http_status(:ok)
    end
  end
end
