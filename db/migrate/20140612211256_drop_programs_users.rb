class DropProgramsUsers < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.table_exists? :programs_users
  	   drop_table :programs_users
    end   
  end

  def down    
  	create_table :programs_users, id: false do |t|
    	t.belongs_to :programs
    	t.belongs_to :users
    end
  end
  	
end
