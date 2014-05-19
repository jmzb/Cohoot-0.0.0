require 'test_helper'

class CampaignTest < ActiveSupport::TestCase

 test "a campaign should have content" do
	campaign = Campaign.new
	assert !campaign.save
	assert !campaign.errors[:content].empty?
 end

 test "campaign content should be at least two letters long" do
 	campaign = Campaign.new
 	campaign.content = "A"
 	assert !campaign.save
 	assert !campaign.errors[:content].empty?

 end

 test "campaign must have a user_id" do
 	campaign = Campaign.new
 	assert !campaign.save
 	assert !campaign.errors[:user_id].empty?
 end	
end
