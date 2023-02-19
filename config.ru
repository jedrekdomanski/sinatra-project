# frozen_string_literal: true

root = ::File.dirname(__FILE__)
require ::File.join(root, 'app')

map '/' do
  run ApplicationController
end

map '/articles' do
  run ArticlesController
end

map '/authors' do
  run AuthorsController
end
