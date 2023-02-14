# frozen_string_literal: true

class ArticlesController < ApplicationController
  get '/articles' do
    articles = Article.all
    { articles: articles }.to_json
  end

  get '/articles/:id' do
    article = Article.find(params['id'])
    { article: article }.to_json
  end

  post '/articles' do
    data = JSON.parse(request.body.read)
    article = Article.new(
      author_id: data['author_id'],
      title: data['title'],
      content: data['content'],
      published_on: Time.now
    )
    if article.save
      status 200
      { article: article }.to_json
    else
      status 400
      { errors: article.errors.full_messages }.to_json
    end
  end
end

