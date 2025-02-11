require File.expand_path(File.dirname(__FILE__) + "/environment") # Rails.root(Railsメソッド)を使用するために必要
rails_env = ENV['RAILS_ENV'] || :development # cronを実行する環境変数(:development, :product, :test)
set :environment, rails_env # cronを実行する環境変数をセット
set :output, "#{Rails.root}/log/cron.log" # cronのログ出力用ファイル
ENV.each { |k, v| env(k, v) } # 環墩変数をcronで使用できるように設定

every 1.minute do
  rake "notifications:send"
end

every 1.day, at: '0:00 am' do
  runner "HabitProgress.where(date: Date.current).update_all(checked: false)"
end
