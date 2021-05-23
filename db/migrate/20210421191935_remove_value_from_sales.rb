class RemoveValueFromSales < ActiveRecord::Migration[6.1]
  def change
    remove_column :sales, :value, :decimal
  end
end
