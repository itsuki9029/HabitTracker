class QuestionsController < ApplicationController
  def new
    @question = session.delete(:question) # セッションから取得して削除
    @answer = session.delete(:answer)
  end

  def create
    client = OpenAiClient.new
    session[:question] = params[:question]
    session[:answer] = client.ask_question(session[:question])

    redirect_to new_question_path
  end
end
