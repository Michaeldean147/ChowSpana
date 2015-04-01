class FixLatAndLong < ActiveRecord::Migration
  def change
    change_column :posts, :latitude, 'float USING CAST(latitude AS float)'
    change_column :posts, :longitude, 'float USING CAST(longitude AS float)'
  end
end
