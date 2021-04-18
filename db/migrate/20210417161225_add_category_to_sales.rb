class AddCategoryToSales < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :category, :string
  end
end
