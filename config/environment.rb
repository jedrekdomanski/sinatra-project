# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'

require 'sinatra/activerecord'
require 'sinatra/base'
require 'json'
require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

current_dir = Dir.pwd
Dir["#{current_dir}/app/{controllers,helpers,models}/*.rb"].sort.each { |file| require file }
