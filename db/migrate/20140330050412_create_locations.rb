class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :loc_name
      t.string :loc_street
      t.string :loc_city
      t.string :loc_state
      t.integer :loc_zip
      t.string :loc_phone
      t.string :loc_fax

      t.timestamps
    end
  end
end
