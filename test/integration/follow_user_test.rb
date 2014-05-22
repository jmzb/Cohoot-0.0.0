require 'test_helper'

class FollowUserTest < ActionDispatch::IntegrationTest
  
  def sign_in_as(user, password)
  	post login_path, user: { email: user.email, password: password }
  end	

  test "that following a user actually works" do
  	sign_in_as users(:testUser1), "password"
  	get "/follow_users/new?followed_id=#{users(:testUser2).id}"
  	assert_response :success
 
 #count failing?
  	assert_difference "FollowUser.count" do
  		post "/follow_users", follow_user: { user_id: users(:testUser1).id, followed_id: users(:testUser2).id }
  		assert_response :redirect
  	end 	

  end
  

end
