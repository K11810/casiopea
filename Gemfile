source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails'
gem 'unicorn'
gem 'mini_racer', platforms: :ruby
gem 'devise'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'
gem 'aws-sdk-s3'
gem 'ed25519'
gem 'bcrypt_pbkdf'
gem 'faker'

# notification
gem 'whenever', require: false

# pagination
gem 'kaminari'

# search & sort
gem 'ransack'

# help to kill N+1
gem 'bullet'

# tag
gem 'acts-as-taggable-on'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "rspec-rails"
  gem 'spring-commands-rspec'
  gem "factory_bot_rails"
  gem "database_cleaner"
  gem "launchy"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'letter_opener_web'

end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
