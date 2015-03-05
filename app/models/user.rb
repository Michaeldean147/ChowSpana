class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
end
