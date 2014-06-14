class AddCapacityToPrograms < ActiveRecord::Migration
  def change
  	add_column :programs, :program_capacity, :string
  end
end
