class AddGroupRefToSales < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :group, foreign_key: true
  end
end
