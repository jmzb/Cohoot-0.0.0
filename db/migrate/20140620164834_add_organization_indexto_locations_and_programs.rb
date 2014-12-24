class AddOrganizationIndextoLocationsAndPrograms < ActiveRecord::Migration
  def change
  	add_column :organizations, :program_id, :integer
  	add_index  :organizations, :program_id 
  	
  	add_column :organizations, :location_id, :integer
  	add_index  :organizations, :location_id
  end
end
