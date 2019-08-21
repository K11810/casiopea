require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, { :error => 'log/whenever.log', :standard => 'log/cron.log' }

# 負荷分散のため各タスクの実行時間を30分単位でズラす
  set :environment, :production
  every 1.day, at: '7:00 am' do
    rake "notification:yesterday_words"
  end

  set :environment, :production
  every 1.day, at: '7:30 am' do
    rake "notification:three_days_ago_words"
  end

  set :environment, :production
  every 1.day, at: '8:00 am' do
    rake "notification:one_week_ago_words"
  end

  set :environment, :production
  every 1.day, at: '8:30 am' do
    rake "notification:two_week_ago_words"
  end

  set :environment, :production
  every 1.day, at: '9:00 am' do
    rake "notification:one_month_ago_words"
  end

  set :environment, :production
  every 1.day, at: '9:30 am' do
    rake "notification:three_months_ago_words"
  end

  set :environment, :production
  every 1.day, at: '10:00 am' do
    rake "notification:six_months_ago_words"
  end

  set :environment, :production
  every 1.day, at: '10:30 am' do
    rake "notification:one_year_ago_words"
  end

  set :environment, :production
  every 1.day, at: '11:00 am' do
    rake "notification:three_years_ago_words"
  end

  set :environment, :production
  every 1.day, at: '11:30 am' do
    rake "notification:five_years_ago_words"
  end
