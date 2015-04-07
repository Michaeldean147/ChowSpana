class Post < ActiveRecord::Base

  def full_address
    [address, city, state].compact.join(', ')
  end
  #
  # geocoded_by full_address(:address,:city,:state)
  # def full_address
  #   "#{self.address}, #{self.city}, #{self.state}"
  # end

  geocoded_by :full_address

  after_validation :geocode, :if => :address_changed?

  self.per_page = 3

  belongs_to :user
  has_many :comments

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
