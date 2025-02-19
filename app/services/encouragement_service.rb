class EncouragementService
	def self.get_message(habit_name)
		prompt = <<~PROMPT
			私は「#{habit_name}」という習慣を続けています。
			やる気が出るような励ましの言葉を日本語でお願いします。
			また、あれば#{habit_name}を継続することのメリットを教えてください。
			オッケーやわかったなどの反応は不要です。
			計80文字以内でお願いします。
		PROMPT

		client = OpenAiClient.new
		client.ask_question(prompt)
	end
end
