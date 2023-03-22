# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord'
gem 'pg'
gem 'rake'
gem 'rubocop', '~> 1.39', require: false
gem 'sinatra'
gem 'sinatra-activerecord'

group :test do
  gem 'database_cleaner'
  gem 'faker'
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'rack-test'
  gem 'rubocop-rspec', '~> 2.11', require: false
  gem 'rspec'
end

group :development, :test do
  gem 'pry', require: true
end
