class CreateStationTrains < ActiveRecord::Migration[5.2]
  def change
    create_table :station_trains do |t|
      t.references :station, foreign_key: true
      t.references :train, foreign_key: true

      t.timestamps
    end
  end
end
