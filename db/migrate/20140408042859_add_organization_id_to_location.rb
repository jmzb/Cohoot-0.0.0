class AddOrganizationIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :organization_id, :integer
    add_index :locations, :organization_id
  end
end
