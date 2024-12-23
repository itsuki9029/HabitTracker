require 'line/bot'

class LineNotifier
  def self.client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_ACCESS_TOKEN']
    }
  end

  def self.push_message(user_id, message)
    client.push_message(user_id, { type: 'text', text: message })
  end
end
