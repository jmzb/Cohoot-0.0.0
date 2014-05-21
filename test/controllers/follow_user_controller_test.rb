require 'test_helper'

class FollowUsersControllerTest < ActionController::TestCase
  context "#new" do
  	context "when not logged in" do
  		should "should redirect to login page" do
  			get :new
  			assert_response :redirect
  		end	
  	end	

  	context "when logged in" do
  		setup do 
  			sign_in users(:testUser1)
  		end 	

#ERROR No route matches {:controller=>"follow_users", :action=>"new"}
  		should "should get new and return success" do  
  			get :new
  			assert_response :success
  		end 

#ERROR
  		should "should set a flash error if the followed_id params is missing" do 
  			get :new, {}
  			assert_equal "Uh oh, we couldn't find the account you were looking to follow.", flash[:error]
  		end

#ERROR
  		should "display followed's name" do
  			get :new, followed_id: users(:testUser2).id
  			assert_match /#{users(:testUser2).full_name}/, response.body
  		end	

#ERROR
  		should "assign new followed user" do  
  			get :new, followed_id: users(:testUser2).id
  			assert assigns(:follow_user).followed
  		end	

#ERROR
  		should "assign new follower user" do
  			get :new, followed_id: users(:testUser2).id
  			assert assigns(:follow_user).follower
  		end

#ERROR
  		should "should assign correct followed account to follower" do 
  			get :new, followed_id: users(:testUser2).id
  			assert_equal users(:testUser2), assigns(:follow_user).followed
  		end	

#ERROR
  		should "assign the currently logged in user as follower" do
  			get :new, followed_id: users(:testUser2).id
  			assert_equal users(:testUser1), assigns(:follow_user).follower
  		end	
#ERROR
  		should "return a 404 stattus if the account can't be found" do
  			get :new, followed_id: 'invalid'
  			assert_response :not_found
  		end	

  	end # end context when logged in

  end # end #new	

  context "#delete" do
 	context "when not logged in" do
  	end # end context when not logged in
  	context "when logged in" do
    end # end context when logged in 	
  end # end context #delete		

end
