class AddStateToFollowUser < ActiveRecord::Migration
  def change
  	add_column :follow_users, :state, :string
  	add_index :follow_users, :state
  end
end
