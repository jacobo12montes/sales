class RemoveCategoryFromSales < ActiveRecord::Migration[6.1]
  def change
    remove_column :sales, :category, :string
  end
end
