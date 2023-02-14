# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Article do
  it 'is invalid without title' do
    article = Article.new(content: Faker::Lorem.sentence(word_count: 3), author_id: 1)
    expect(article).to be_invalid
  end

  it 'is invalid without content' do
    article = Article.new(title: Faker::Lorem.sentence(word_count: 3), author_id: 1)
    expect(article).to be_invalid
  end

  it 'is invalid without author' do
    article = Article.new(
      content: Faker::Lorem.sentence(word_count: 3),
      title: Faker::Lorem.sentence(word_count: 3),
      author_id: nil
    )
    expect(article).to be_invalid
  end

  it 'is valid wit all requried attributes' do
    article = Article.new(
      content: Faker::Lorem.sentence(word_count: 3),
      title: Faker::Lorem.sentence(word_count: 3),
      author_id: 1
    )
    expect(article).to be_valid
  end
end
