class AddTaglineToOrganization < ActiveRecord::Migration
  def change
  	add_column :organizations, :tagline, :text
  	add_index :organizations, :tagline
  end
end
