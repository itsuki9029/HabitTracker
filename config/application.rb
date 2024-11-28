require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.0
    # デフォルトのロケールを日本語に設定
    config.i18n.default_locale = :ja
    config.hosts << "habittracker-b0jn.onrender.com"  #ホスト先が認められないエラー対策
  end
end
