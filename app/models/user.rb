class User < ActiveRecord::Base
  has_many :posts
  has_many :favorites
  has_many :comments
  has_many :favorited_posts, through: :favorites, source: :post,  dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
end
