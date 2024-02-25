source 'https://rubygems.org'

ruby '3.2.3'

gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3'
# gem "jbuilder"
# gem "redis", ">= 4.0.1"
# gem "kredis"
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'devise'
gem 'devise-jwt'
gem 'jsonapi-serializer'
gem 'rack-cors'
gem 'rswag'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'money-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'database_cleaner'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'rubocop'
  gem 'rubocop-factory_bot'
  gem 'rubocop-performance'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
end

group :development do
  gem 'spring'
end
