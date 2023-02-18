# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'

require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'json'

current_dir = Dir.pwd
Dir["#{current_dir}/app/{helpers,controllers,models,serializers}/*.rb"].each { |file| require file }
