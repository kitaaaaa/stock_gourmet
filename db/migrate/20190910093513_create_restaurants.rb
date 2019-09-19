class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
    	t.string :name, null: false, default: ""
    	t.integer :genre_id, null: false
    	t.string :menu
    	t.integer :budget
    	t.string :postal_code
    	t.text :address
      t.integer :station_id, null: false
      t.integer :restaurant_tag_id
      t.float :latitude
      t.float :longitude
      t.string :image
    	#お気に入り区分も
      t.timestamps
    end
  end
end
