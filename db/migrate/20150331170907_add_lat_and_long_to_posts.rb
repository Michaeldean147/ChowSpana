class AddLatAndLongToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :latitude, :string
    add_column :posts, :longitude, :string
  end
end
