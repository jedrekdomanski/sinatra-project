# frozen_string_literal: true

class AuthorsController < ApplicationController
  get '/authors' do
    authors = Author.all
    authors.map { |author| serialize(author) }
  end

  get '/authors/:id' do
    author = Author.find(params['id'])
    serialize(author)
  end

  post '/authors' do
    author = Author.new(json_params)
    halt 422, serialize(author) unless author.save

    response.headers['Location'] = "#{base_url}/authors/#{author.id}"
    status 201
  end
end
