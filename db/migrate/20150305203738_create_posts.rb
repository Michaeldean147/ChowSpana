class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :productname
      t.text :description
      t.string :price
      t.string :location
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
