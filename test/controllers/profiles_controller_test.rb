require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  
  test "should get show" do
    get :show, id: users(:testUser1).first_name
    assert_response :success
    assert_template 'profiles/show'
  end
  
  test "should rended 404 if not found" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
  	get :show, id: users(:testUser1).first_name
  	assert assigns(:user)
  	assert_not_empty assigns(:campaigns)
  end	

  test "that only the correct user's status" do
  	get :show, id: users(:testUser1).first_name
  		@campaigns = @user.campaigns.load
  		assigns(:campaings.each) do |campaign|
  		assert_equal users(:testUser1), campaign.user
  	    end
  end	

end
 