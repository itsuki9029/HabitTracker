Rails.application.config.middleware.use OmniAuth::Builder do
  provider :line, ENV['LINE_KEY'], ENV['LINE_SECRET']
end

OmniAuth.config.allowed_request_methods = [:post]
OmniAuth.config.silence_get_warning = true # GETリクエスト警告の抑制
