# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord'
gem 'pg'
gem 'rack'
gem 'rackup'
gem 'rake'
gem 'rubocop', '~> 1.39', require: false
gem 'sinatra'
gem 'sinatra-activerecord'

group :test do
  gem 'database_cleaner'
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'rack-test'
  gem 'rspec'
  gem 'rubocop-rspec', '~> 2.11', require: false
end

group :development, :test do
  gem 'faker'
  gem 'pry', require: true
end
