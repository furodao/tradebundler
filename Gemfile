source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'
gem 'normalize-rails'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby

gem 'devise'#, git: 'https://github.com/plataformatec/devise'
#gem 'devise_token_auth'#, git: 'https://github.com/lynndylanhurley/devise_token_auth'
gem 'devise_token_auth', github:"lynndylanhurley/devise_token_auth", branch: "master"

gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'
gem 'haml-rails'
gem "font-awesome-rails"

gem 'dotenv-rails'
gem 'dotenv-deployment', require: 'dotenv/deployment'

gem 'mini_magick'
gem 'carrierwave', github:'carrierwaveuploader/carrierwave'
gem 'carrierwave-aws'

gem 'redis', '~>3.2'
gem 'redis-namespace'
gem 'sidekiq'

gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'pry'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-unicorn', require: false
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
