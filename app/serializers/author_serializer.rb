# frozen_string_literal: true

class AuthorSerializer
  def initialize(author)
    @author = author
  end

  def as_json(*)
    data = {
      id: @author.id,
      name: @author.name,
      email: @author.email
    }
    data[:errors] = @author.errors if @author.errors.any?
    data
  end
end
