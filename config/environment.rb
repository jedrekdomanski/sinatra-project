# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'

require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'json'
