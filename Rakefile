# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

require File.expand_path('config/environment', __dir__)

task :console do
  require 'pry'
  Pry.start
end

namespace :db do
  task :load_config do
    require './app'
  end
end

