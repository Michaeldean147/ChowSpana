class Post < ActiveRecord::Base


  self.per_page = 3

  belongs_to :user

  validates :productname, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true


  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
