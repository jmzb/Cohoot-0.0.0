require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
