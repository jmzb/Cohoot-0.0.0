require 'test_helper'

class FollowUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:user)
  should belong_to(:follower)
  should belong_to(:followed)

  test "that following a user works without raising an exception" do
  	assert_nothing_raised do
  		FollowUser.create follower: users(:testUser1), followed: users(:testUser3)
  	end
  end

  test "that following a user works based on user id and following id" do
  	FollowUser.create user_id: users(:testUser1).id, following_id: users(:testUser3).id
  	assert users(:testUser1).follower.include?(:testUser3)
  end


end
