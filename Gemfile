# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.1"
gem "redis", "~> 4.0"
gem "rubocop", require: false
gem "rubocop-performance", require: false
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "omniauth"
gem "omniauth-slack"
gem "bootstrap", "~> 5.1.3"
gem "autoprefixer-rails"
gem "faker"
gem "font-awesome-rails"
gem "httparty"
gem "slackathon", git: "https://github.com/sanjays254/slackathon"
gem "factory_bot"

gem "bootsnap", require: false
group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 5.0.0"
end

group :development do
  gem "web-console"
  gem "pry-rails"
end

group :test do
  gem "shoulda-matchers", "~> 5.0"
end
