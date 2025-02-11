require 'line/bot'

class LineBotClient
  def self.client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token  = ENV["LINE_CHANNEL_ACCESS_TOKEN"]
    end
  end

  def self.push_message(uid, text)
    message = { type: 'text', text: text }
    client.push_message(uid, message)
  end
end
