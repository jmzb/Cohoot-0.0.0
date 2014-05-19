class AddOrgIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :org_id, :integer
    add_index :locations, :org_id
  end
end
