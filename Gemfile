# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord'
gem 'pg'
gem 'rake'
gem 'sinatra'
gem 'sinatra-activerecord'

group :test do
  gem 'database_cleaner'
  gem 'faker'
  gem 'rack-test'
  gem 'rspec'
end

group :development, :test do
  gem 'pry'
end
