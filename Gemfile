source 'https://rubygems.org'

gem 'rails', '>= 5.0.0.beta2', '< 5.1'

gem 'puma'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'sqlite3'

gem 'jquery-rails'
gem 'haml-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

# Action Cable dependencies for the Redis adapter
gem 'redis', '~> 3.0'

gem 'sidekiq'
gem 'sinatra', :require => nil, github: 'sinatra/sinatra', branch: 'mustermann'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
