# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Author do
  it 'is invalid without name' do
    author = described_class.new(email: 'example@email.com')
    expect(author).to be_invalid
  end

  it 'is invalid without email' do
    author = described_class.new(name: 'First Last')
    expect(author).to be_invalid
  end

  it 'is valid with all required attributes' do
    author = described_class.new(name: 'First Last', email: 'example@email.com')
    expect(author).to be_valid
  end
end
