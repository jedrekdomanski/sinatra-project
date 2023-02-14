# frozen_string_literal: true

class Article < ActiveRecord::Base
  belongs_to :author, dependent: :destroy

  validates :title, :content, :author_id, presence: true
end
