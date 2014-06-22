class AddStateToStaff < ActiveRecord::Migration
  def change
		add_column :staffs, :state, :string
  	add_index :staffs, :state
  end
end
