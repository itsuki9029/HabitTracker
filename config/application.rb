require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.0
    # デフォルトのロケールを日本語に設定
    config.i18n.default_locale = :ja
    config.hosts << "habitora9029.com"  #ホスト先が認められないエラー対策
    # config.hosts << "habit-tracker-zt83.onrender.com"
  end
end
