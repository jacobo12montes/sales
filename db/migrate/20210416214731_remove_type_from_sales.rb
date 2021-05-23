class RemoveTypeFromSales < ActiveRecord::Migration[6.1]
  def change
    remove_column :sales, :type, :string
  end
end
