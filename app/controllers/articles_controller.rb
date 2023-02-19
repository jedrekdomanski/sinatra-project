# frozen_string_literal: true

class ArticlesController < ApplicationController
  get '/articles' do
    articles = Article.all
    articles.map { |article| serialize(article) }
  end

  get '/articles/:id' do
    halt_if_not_found!(article)
    serialize(article)
  end

  post '/articles' do
    article = Article.new(json_params)

    halt 422, serialize(article) unless article.save

    response.headers['Location'] = "#{base_url}/articles/#{article.id}"
    status 201
  end

  patch '/articles/:id/like' do
    halt_if_not_found!(article)
    halt 422, serialize(article) unless article.update(likes: article.likes += 1)
    serialize(article)
  end
end
