class CreateProgramActivities < ActiveRecord::Migration
  def change
    create_table :program_activities do |t|
      t.string :activity_name
      t.text :activity_short_desc
      t.integer :program_id	
      t.index :program_id
      t.timestamps
    end
  end
end
