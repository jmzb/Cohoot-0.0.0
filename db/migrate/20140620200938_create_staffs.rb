class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
    	t.integer :user_id
    	t.index :user_id

    	t.integer :organization_id
    	t.index :organization_id
    	
        t.timestamps
    end
  end
end
