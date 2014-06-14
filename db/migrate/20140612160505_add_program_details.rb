class AddProgramDetails < ActiveRecord::Migration
  def change
  	add_column :programs, :ideal_candidate, :text
  	add_column :programs, :initial_condition, :text
  	add_column :programs, :goal_condition, :text
  	add_column :programs, :next_step, :string
  	add_column :programs, :org_id, :integer
    add_index :programs, :org_id
  end
end
