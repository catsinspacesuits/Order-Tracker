class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :start_point
      t.string :restaurant_location
      t.string :customer_location
      t.integer :fee

      t.timestamps
    end
  end
end
