source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'carrierwave', '~> 1.3', '>= 1.3.1'
gem 'faker', '~> 1.9', '>= 1.9.3'
gem 'fast_jsonapi', '~> 1.5'
gem 'fog'
gem 'jbuilder', '~> 2.5'
gem 'jwt_sessions', '~> 2.4', '>= 2.4.1'
gem 'mini_magick', '~> 4.8'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit', '~> 2.0', '>= 2.0.1'
gem 'rack-cors', '~> 1.0', '>= 1.0.3'
gem 'rails', '~> 5.2.2'
gem 'redis', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'rubocop', '~> 0.63.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'dox', '~> 1.0.0', require: false
  gem 'factory_bot_rails'
  gem 'json-schema-rspec'
  gem 'json_matchers', '~> 0.11.0'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
