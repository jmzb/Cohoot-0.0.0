class AddHistoryToOrganizations < ActiveRecord::Migration
  def change
  	add_column :organizations, :history, :text
  	add_index :organizations, :history
  end
end
