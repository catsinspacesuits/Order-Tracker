class ChangeFeeToBeFloatInOrders < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :fee, :decimal
  end
end
