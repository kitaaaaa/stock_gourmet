class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
    	t.string :name, null: false, default: ""
    	t.integer :user_tag_id, false
    	t.integer :restaurant_tag_id
      t.timestamps
    end
  end
end
