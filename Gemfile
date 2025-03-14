source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8", ">= 7.0.8.6"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

gem 'devise', "~> 4.9.4"             # ユーザー認証

gem 'devise-i18n', "~> 1.12.1"       # 多言語対応

gem 'simple_form', "~> 5.3.1"        # フォームヘルパー

gem 'bootstrap', '~> 5.3.3' # フロントエンドスタイル

gem 'jquery-rails', '~> 4.6.0'

gem 'rails-i18n', "~> 7.0.10"         # 多言語対応

gem 'sassc-rails'  #bootstrap-rubygemがSassエンジン（例：sassc-rails、cssbundling-rails、dartsass-railsなど）を依存関係として必要としている

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem 'whenever', require: false           # cronでの通知スケジュール管理

gem 'carrierwave', "~> 3.0.7"

gem 'ransack', "~> 4.2.1"

gem "line-bot-api", "~> 1.29"

gem 'omniauth-line' #LINEログイン

gem 'omniauth-rails_csrf_protection'

gem 'dotenv-rails'

gem 'fog-aws'

gem "meta-tags"

gem 'concurrent-ruby', '1.3.4'

gem 'acts-as-taggable-on'

gem 'simple_calendar'

gem 'ruby-openai'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  gem 'rspec-rails'

  gem 'factory_bot_rails'

  gem 'byebug'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  gem 'letter_opener_web'

  gem 'listen'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

end
