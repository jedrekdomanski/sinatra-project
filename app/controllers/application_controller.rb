# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers ::ApiHelper

  configure :production, :development do
    enable :logging
  end

  before do
    authenticate!
    content_type :json
  end

  get '/hello' do
    { message: 'Hello!' }.to_json
  end
end
