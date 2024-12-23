class UserNotifier
  def self.send_line_notification(user, message)
    return unless user.line_user_id.present?

    LineNotifier.push_message(user.line_user_id, message)
  end
end
