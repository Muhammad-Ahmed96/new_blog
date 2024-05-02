class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :name, presence: true

  validates :email, presence: true

  validates_uniqueness_of :email

  validates :password, length: { minimum: 5, maximum: 10}
end
