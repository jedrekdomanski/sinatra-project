# frozen_string_literal: true

class ArticlesController < ApplicationController
  before { authenticate! }

  get '/' do
    articles = Article.all
    articles.map { |article| serialize(article) }
  end

  get '/:id' do
    halt_if_not_found!(article)
    serialize(article)
  end

  post '/' do
    article = Article.new(json_params)

    halt 422, serialize(article) unless article.save

    response.headers['Location'] = "#{base_url}/articles/#{article.id}"
    serialize(article)
  end

  patch '/articles/:id/like' do
    halt_if_not_found!(article)
    halt 422, serialize(article) unless article.update(likes: article.likes += 1)
    serialize(article)
  end

  private

  def article
    @article ||= Article.find(params['id'])
  end
end
