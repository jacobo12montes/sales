class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :title
      t.string :description
      t.decimal :value
      t.string :type
      t.date :date

      t.timestamps
    end
  end
end
