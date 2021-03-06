source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'rails'

# Use Puma as the app server
gem 'puma'

gem 'sass-rails'

gem 'webpacker'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'devise'
gem 'acts-as-taggable-on'
gem 'friendly_id'
gem "image_processing"
gem 'impressionist',
  git: 'git@github.com:FritjofH/impressionist.git',
  ref: '46a582ff8cd3496da64f174b30b91f9d97e86643'
gem "stimulus_reflex"
gem 'rubocop'
gem 'bundler-audit'
gem 'brakeman'
gem "redis"
gem "hiredis"
gem 'redis-session-store'
gem 'meta-tags'

gem 'pg'

group :production do
  gem 'rails_12factor'
  gem 'activestorage-backblaze'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end