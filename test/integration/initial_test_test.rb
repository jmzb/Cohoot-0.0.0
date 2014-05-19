require 'test_helper'

class InitialTestTest < ActionDispatch::IntegrationTest
 test "that /login route opens the login page" do
 	get '/login'
 	assert_response :success
 end

 test "that /logout route openns the logout page" do
 	delete '/logout'
 	assert_response :redirect
 	assert_redirected_to '/'
 end	

 test "that a profile page loads" do
 	get '/Spaceman'
 	assert_response :success
 end 	

end
