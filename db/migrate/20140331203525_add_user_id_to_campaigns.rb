class AddUserIdToCampaigns < ActiveRecord::Migration
  def change
  	add_column :campaigns, :user_id, :integer
  	add_index  :campaigns, :user_id
  end
end
