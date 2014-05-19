class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :prog_name
      t.text :prog_obj
      t.timestamps
    end
  end
end
