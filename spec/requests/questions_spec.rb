require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:user) { create(:user) }
  let(:question_params) { { content: "これはテストの質問です" } } # 適切なキー名にする

  before do
    sign_in user
  end

  describe "GET /questions/new" do
    it "質問ページにアクセスできる" do
      get new_question_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /questions" do
    it "質問をし、セッションに保存される" do
      post questions_path, params: { question: question_params }

      expect(session[:question].to_unsafe_h.symbolize_keys).to eq(question_params)
      expect(session[:answer]).to be_present # AIの返答が入ることを期待
      expect(response).to redirect_to(new_question_path)
    end
  end
end
