class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.string :name, null: false, default: ""
			t.string :address, null: false, default: ""    	
      t.timestamps
    end
  end
end
