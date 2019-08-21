require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, { :error => 'log/whenever.log', :standard => 'log/cron.log' }

set :environment, :development
every 1.minute do
  rake "notification:mail_test_in_dev"
end

set :environment, :development
every 1.minute do
  rake "notification:mail_test_in_dev2"
end

set :environment, :production
every 3.minute do
  rake "notification:mail_test_in_pro1"
end

set :environment, :production
every 3.minute do
  rake "notification:mail_test_in_pro2"
end
