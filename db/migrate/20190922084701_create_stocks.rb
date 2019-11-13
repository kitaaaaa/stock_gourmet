class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
