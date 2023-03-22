# frozen_string_literal: true

require 'faker'
require_relative '../app'

10.times do
  author = Author.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", email: Faker::Internet.email)
  author.articles.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.sentence(word_count: 10),
    published_on: Time.now
  )
end
