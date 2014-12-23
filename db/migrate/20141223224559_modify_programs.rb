class ModifyPrograms < ActiveRecord::Migration
  def change
  	add_column :programs, :hrs_mon_s, :time
  	add_index :programs, :hrs_mon_s
  	add_column :programs, :hrs_mon_e, :time
  	add_index :programs, :hrs_mon_e

  	add_column :programs, :hrs_tues_s, :time
  	add_index :programs, :hrs_tues_s
  	add_column :programs, :hrs_tues_e, :time
  	add_index :programs, :hrs_tues_e

  	add_column :programs, :hrs_wed_s, :time
  	add_index :programs, :hrs_wed_s
  	add_column :programs, :hrs_wed_e, :time
  	add_index :programs, :hrs_wed_e

  	add_column :programs, :hrs_thurs_s, :time
  	add_index :programs, :hrs_thurs_s
  	add_column :programs, :hrs_thurs_e, :time
  	add_index :programs, :hrs_thurs_e

  	add_column :programs, :hrs_fri_s, :time
  	add_index :programs, :hrs_fri_s
  	add_column :programs, :hrs_fri_e, :time
  	add_index :programs, :hrs_fri_e

  	add_column :programs, :hrs_sat_s, :time
  	add_index :programs, :hrs_sat_s
  	add_column :programs, :hrs_sat_e, :time
  	add_index :programs, :hrs_sat_e

  	add_column :programs, :hrs_sun_s, :time
  	add_index :programs, :hrs_sun_s
  	add_column :programs, :hrs_sun_e, :time
  	add_index :programs, :hrs_sun_e

  	add_column :programs, :candidate_requirements, :text
  	add_index :programs, :candidate_requirements

  	add_column :programs, :prog_cost, :string
  	add_index :programs, :prog_cost

  	add_column :programs, :prog_hours, :decimal
  	add_index :programs, :prog_hours

  	add_column :programs, :prog_hours_per_units, :string
  	add_index	:programs, :prog_hours_per_units

  	add_column :programs, :length_of_prog, :text
  	add_index :programs, :length_of_prog

  	remove_column :programs, :initial_condition, :text

  	remove_column :programs, :program_capacity, :string
  end
end
