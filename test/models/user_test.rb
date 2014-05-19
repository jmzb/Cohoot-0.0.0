require 'test_helper'

class UserTest < ActiveSupport::TestCase

	should have_many(:follow_users)
	should have_many(:followers)
	should have_many(:followed)

	test "a user should enter a first name" do
	user = User.new
	assert !user.save
	assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
	user = User.new
	assert !user.save
	assert !user.errors[:last_name].empty?
	end	

	test "no error is raised when trying to access a followed list" do
		assert_nothing_raised do
			users(:testUser1).followed
		end
	end 

#The following test is broken, and I don't know how to fix... also I don't actually understand what it does
	test "that making a user a followed works" do
		users(:testUser1).followed << users(:testUser3)
		users(:testUser1).followed.reload
		assert users(:testUser1).followed.include?(:testUser3)
	end

end

