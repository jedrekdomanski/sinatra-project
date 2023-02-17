# frozen_string_literal: true

class ArticleSerializer
  def initialize(article)
    @article = article
  end

  def as_json(*)
    data = {
      id: @article.id,
      title: @article.title,
      content: @article.content,
      published_on: @article.published_on,
      published: @article.published,
      likes: @article.likes,
      author_id: @article.author_id
    }
    data[:errors] = @article.errors if @article.errors.any?
    data
  end
end
