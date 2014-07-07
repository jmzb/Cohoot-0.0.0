require 'test_helper'

class UserTest < ActiveSupport::TestCase


	should have_many(:campaigns)

	should have_one(:staff)
	should have_one(:organization).through(:staff)

	  #failing
  	#should have_many(:programs).through(:organizaiton).source(:staff)
  	#failing
  	#should have_many(:locations).through(:organizaiton).source(:staff)

	should have_many(:follow_users)
	should have_many(:followers).through(:follow_users)
	should have_many(:followeds).through(:follow_users)
	should have_many(:reverse_user_rels).class_name("FollowUser").with_foreign_key("followed_id").dependent(:destroy)
  should have_many(:followed_bys).through(:reverse_user_rels).source(:follower)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
	#should should validate_acceptance_of(:terms_of_service) #.with_message('You must accept the terms of service')

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
			users(:testUser1).followeds
		end
	end 

	test "that making a user a followed works" do
		users(:testUser1).followeds << users(:testUser3)
		users(:testUser1).followeds.reload
		assert users(:testUser1).followeds.includes(:testUser3)
	end

end

