class CreateFollowUsers < ActiveRecord::Migration
  def change
    create_table :follow_users do |t|
    	t.integer :user_id
    	t.integer :following_id
      t.timestamps
    end

    add_index :follow_users, [:user_id, :following_id]

  end
end
