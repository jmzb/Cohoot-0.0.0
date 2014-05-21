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

  test "that user.follow_users is created" do
    FollowUser.create follower: users(:testUser1), followed: users(:testUser3)
    assert users(:testUser1).follow_users, "user.follow_user was not even created"
  end  

  test "that user.follow_users is created with user_id and followed_id" do
    FollowUser.create user_id: users(:testUser1), followed_id: users(:testUser3)
    assert users(:testUser1).follow_users, "user.follow_user was not even created with the user_id and followed_id" 
  end  

#currently fails
  test "that user.follow_users includes a followed" do 
    FollowUser.create follower: users(:testUser1), followed: users(:testUser3)
    assert users(:testUser1).follow_users.include?(:followed), "user.follow_user does not inlcude :followed"
  end  

#currently fails
  test "that user.follow_users includes a followed_id" do 
    FollowUser.create user_id: users(:testUser1), followed_id: users(:testUser3)
    assert users(:testUser1).follow_users.include?(:followed_id), "user.follow_user does not inlcude :followed_id"
  end  

#currently fails
  test "that user.follow_users includes a user_id" do 
    FollowUser.create user_id: users(:testUser1), followed_id: users(:testUser3)
    assert users(:testUser1).follow_users.include?(:user_id), "user.follow_user does not inlcude :user_id"
  end  
  
#THIS IS SUPER STRANGE
test "that user.follow_users includes the correct user" do 
    FollowUser.create user_id: users(:testUser1), followed_id: users(:testUser3)
    assert users(:testUser1).follow_users.include?(:testUser1), "user.follow_user does not inlcude the correct user"
  end  

#currently fails
  test "that correct follower and followed are assigned when creating follow_users relationship" do 
    FollowUser.create follower: users(:testUser1), followed: users(:testUser3)
    assert users(:testUser1).follow_users.include?(:testUser3), "user.follow_user does not include corrrect followed"
  end  

#currently fails
  test "that creating a follow_user correctly relates user_id and followed_id" do 
  	FollowUser.create user_id: users(:testUser1), followed_id: users(:testUser3)
    assert users(:testUser1).follow_users.include?(:testUser3), "user.follow_users does not include the correct followed_id"
  end


end
