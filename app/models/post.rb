

class Post < ApplicationRecord
  self.per_page = 2

  has_rich_text :body

  belongs_to :user

  # validates :title, presence: true
  validates_presence_of :title, :body
end