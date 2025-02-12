require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # テスト環境でCSRFトークンの検証をスキップ
  config.before(:each, type: :request) do
    allow_any_instance_of(ActionController::Base).to receive(:verify_authenticity_token).and_return(true)
  end

  config.fixture_path = Rails.root.join('spec/fixtures')

  config.use_transactional_fixtures = true

  config.filter_rails_from_backtrace!

  config.include Devise::Test::IntegrationHelpers, type: :request

  config.include FactoryBot::Syntax::Methods
end
