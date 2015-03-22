class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, dependent: :destroy
end
