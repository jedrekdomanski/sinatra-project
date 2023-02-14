# frozen_string_literal: true

class AuthorsController < ApplicationController
  get '/authors' do
    authors = Author.all
    { authors: authors }.to_json
  end

  get '/authors/:id' do
    author = Author.find(params['id'])

    { author: author }.to_json
  end

  post '/authors' do
    data = JSON.parse(request.body.read)
    author = Author.new(name: data['name'], email: data['email'])
    if author.save
      status 200
      { author: author }.to_json
    else
      status 400
      { errors: author.errors.full_messages }.to_json
    end
  end
end
