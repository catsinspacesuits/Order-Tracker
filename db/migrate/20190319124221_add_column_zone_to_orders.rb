class AddColumnZoneToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :zone, :string
  end
end
