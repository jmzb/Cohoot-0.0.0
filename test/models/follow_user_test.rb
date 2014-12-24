require 'test_helper'

class FollowUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:user)
  should belong_to(:follower).class_name("User").with_foreign_key("user_id")
  should belong_to(:followed).class_name("User").with_foreign_key("followed_id")

  should validate_presence_of(:user_id)
  should validate_presence_of(:followed_id)

  context "creating a follow_user relationship with user objects" do
      setup do 
        @follow_user = FollowUser.create follower: users(:testUser1), followed: users(:testUser3)
      end 
        should "create a follow_user relationsihp without raising an exception" do
          assert_nothing_raised do
            @follow_user
          end 
        end
        
        should "create a user.follow_user" do
         assert FollowUser.first, @follow_user
        end

        should "assign correct follower and followed" do
          #this is FollowUser.last because creating a FollowUser generates two instances (one accessible to each user)
          assert_equal FollowUser.last, @follow_user 
        end 

        should "return the correct follower" do
          assert users(:testUser1).follow_users, @follow_user.follower
         
        end 

        should "return the correct followed" do
         assert users(:testUser1).follow_users, @follow_user.followed  
        end 
  end


  context "creating a follow_user relationship with user_id and followed_id" do
    setup do
      @follow_user = FollowUser.create user_id: users(:testUser1).id, followed_id: users(:testUser3).id
    end

      should "create a follow_user relationship without raising an exception" do
          assert_nothing_raised do
            @follow_user
          end 
        end
        
        should "create a user.follow_user (through the id)" do
         assert FollowUser.first, @follow_user
        end
    
        should "assign correct follower and followed (through the id)" do
          assert_equal FollowUser.last, @follow_user
        end 

        should "return the correct follower (through the id)" do
          assert users(:testUser1).follow_users, @follow_user.follower
        end
        
        should "return the correct followed (through the id)" do
          assert users(:testUser1).follow_users, @follow_user.followed
        end
        
        should "assign a user_id to follower and make it accessible to the follower" do
          assert users(:testUser1).follow_users, @follow_user.user_id
        end 

        should "assign a followed_id to followed and make it accessible to the follower" do
          assert users(:testUser1).follow_users, @follow_user.followed_id
        end 

        should "assign a user_id to follower and make it accessible to the followed" do
          assert users(:testUser3).follow_users, @follow_user.user_id
        end 

        should "assign a followed_id to followed and make it accessible to the followed" do
          assert users(:testUser3).follow_users, @follow_user.followed_id
        end 

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
#    should "create two follow_users" do
#      assert_difference 'follow_user.count', 2 do
#       FollowUser.follow_action(users(:testUser1), users(:testUser2))
#     end  
#   end  
  end   



#end  
end
