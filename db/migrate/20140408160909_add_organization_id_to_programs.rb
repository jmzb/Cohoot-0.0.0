class AddOrganizationIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :organization_id, :integer
    add_index :programs, :organization_id
  end
end
