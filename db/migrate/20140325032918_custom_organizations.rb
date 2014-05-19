class CustomOrganizations < ActiveRecord::Migration
  def change

  	add_column :organizations, :website, :string
    add_column :organizations, :main_access, :string
  end
end
