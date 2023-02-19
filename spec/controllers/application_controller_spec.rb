# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApplicationController do
  def app
    ApplicationController
  end

  describe 'GET /hello' do
    it 'says hello' do
      get '/hello'

      expect(last_response).to be_ok
      expect(parsed(last_response)).to eq({ message: 'Hello!' })
    end
  end
end
