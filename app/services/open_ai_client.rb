require 'openai'

class OpenAiClient
  def initialize
    @client = OpenAI::Client.new(
      access_token: ENV.fetch("OPENAI_ACCESS_TOKEN")
    )
  end

  def ask_question(question)
    begin
      response = @client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: "あなたは「メンズコーチジョージ」のような熱血コーチだ！どんな質問にも、前向きで力強く、カジュアルな口調で回答しろ！" },
            { role: "user", content: question }],
          max_tokens: 150
        }
      )
      response.dig("choices", 0, "message", "content").strip
    rescue OpenAI::Error => e
      Rails.logger.error "OpenAI API Error: #{e.message}"
      "申し訳ありません。現在、励ましの言葉を取得できません。"
    rescue StandardError => e
      Rails.logger.error "Unexpected Error: #{e.message}"
      "予期しないエラーが発生しました。"
    end
  end
end
