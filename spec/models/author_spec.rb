# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Author do
  it 'is invalid without name' do
    author = described_class.new(email: 'example@email.com')
    expect(author).to be_invalid
  end
end
