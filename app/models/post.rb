

class Post < ApplicationRecord
  belongs_to :user

  # validates :title, presence: true
  validates_presence_of :title, :body
end