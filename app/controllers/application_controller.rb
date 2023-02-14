# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  # helpers ::ApplicationHelper

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end

  # will be used to display 404 error pages
  # not_found do
  #   status 400
  #   { error: :record_not_found }
  # end

  before do
    content_type :json
  end

  get '/hello' do
    { message: 'Hello!' }.to_json
  end
end

