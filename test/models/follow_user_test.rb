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

#AM I MISSING A CONTEXT OR A SETUP???

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
    assert users(:testUser1).follow_users.include?(:user_id), "VERY STRANGE FAILURE!! user.follow_user does not inlcude :user_id"
  end  
  
#THIS IS SUPER STRANGE
test "that user.follow_users includes the correct user" do 
    FollowUser.create user_id: users(:testUser1), followed_id: users(:testUser3)
    assert users(:testUser1).follow_users.include?(:testUser1), "VERY STRANGE FAILURE!! user.follow_user does not inlcude the correct user"
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


# TESTING STATE
  context "a new instance" do
    setup do
      @follow_user = FollowUser.new follower: users(:testUser1), followed: users(:testUser2)
    end  
  
#Tutorial test--FUNCTIONALITY NOT IMPLEMENTED
#implement a similar test for the creation of a user for an existing organization: 
#implement a similar test for the creation of a user for a not existing organization
#    should "have a pending state" do
#       assert_equal 'pending', @follow_user.state
#    end
  end      

#Tutorial test--FUNCTIONALITY NOT IMPLEMENTED
  context "send request email" do
      setup do
        @follow_user = FollowUser.create follower: users(:testUser1), followed: users(:testUser2)
      end  

#     should "send an email" do
#        assert_difference 'ActionMailer::Base.deliveries.size', 1 do
#           @follow_user.send_request_email
#         end
#      end    
  end  

#Tutorial test--FUNCTIONALITY NOT IMPLEMENTED
  context "#accept!" do
    setup do
        @follow_user = FollowUser.create follower: users(:testUser1), followed: users(:testUser2)
    end  
  
#      should "set the state to accepted" do 
#        @user_friendship.accept!
#        asser_equal "accepted", @user_friendship.state
#      end 

#      should "include the friend in the list of friends"
#        @user_friendship.accept!
#        users(:testUser1).friends.reload
#        assert users(:testUser1).friends.include?(users(:testUser2))
#      end
  end  #end context


  context ".follow_action" do
    should "create two follow_users" do
      assert_difference 'follow_user.count', 2 do
        FollowUser.follow_action(users(:testUser1), users(:testUser2))
      end  

    end  
  end   



#end  
end
