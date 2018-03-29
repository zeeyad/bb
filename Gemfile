source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.3'

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.2'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'jquery-rails'
gem "font-awesome-rails"
gem 'pundit', '~> 1.1'
gem 'ransack', '~> 1.8', '>= 1.8.4'
gem 'friendly_id', '~> 5.2', '>= 5.2.3'
gem 'sendgrid-ruby', '~> 5.2'
gem 'activeadmin', '~> 1.2'
gem 'roo'
gem 'combined_time_select', '~> 2.0'
gem 'carrierwave', '~> 1.2', '>= 1.2.1'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem 'bootstrap_form'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'phantomjs'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
end

group :production do
  gem 'pg', '~> 0.18'
  gem 'newrelic_rpm'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
