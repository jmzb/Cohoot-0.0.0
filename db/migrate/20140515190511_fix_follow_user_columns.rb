class FixFollowUserColumns < ActiveRecord::Migration
  def change
  	change_table :follow_users do |t|
   #   t.rename :old_column1, :new_column1
   #   t.rename :old_column2, :new_column2
   	  t.rename :user_id, :follower_id
   	  t.rename :following_id, :followed_id
   	end  

   	  rename_index :follow_users, 'user_id', 'follower_id'
   	  rename_index :follow_users, 'following_id', 'followed_id'
  end
end
