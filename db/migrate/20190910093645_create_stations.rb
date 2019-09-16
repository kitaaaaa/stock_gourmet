class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
    	t.string :name, null: false, default: ""
    	t.integer :station_train_id, null: false
      t.timestamps
    end
  end
end
