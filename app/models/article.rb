require 'active_record'

class Article < ActiveRecord::Base
  belongs_to :author, dependent: :destroy

  validates :title, :content, presence: true
end

