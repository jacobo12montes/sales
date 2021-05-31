class CreateGroupsales < ActiveRecord::Migration[6.1]
  def change
    create_table :groupsales do |t|
      t.belongs_to :group
      t.belongs_to :sale
      t.timestamps
    end
  end
end
