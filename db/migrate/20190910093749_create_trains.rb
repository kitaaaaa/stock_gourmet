class CreateTrains < ActiveRecord::Migration[5.2]
  def change
    create_table :trains do |t|
    	t.string :name, null: false, default: ""
      t.timestamps
    end
  end
end
