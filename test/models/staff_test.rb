require 'test_helper'

class StaffTest < ActiveSupport::TestCase
 	should belong_to(:organization)
 	should belong_to(:user)

 	should validate_presence_of(:user_id)
  should validate_presence_of(:organization_id)

	context "creating a staff relationship with user and organization objects" do
			setup do 
				@staff = Staff.create user: users(:testUser1), organization: organizations(:testOrg1)
			end	
				should "create a staff without raising an exception" do
					assert_nothing_raised do
						@staff
					end	
				end
				
				should "create a user.staff" do
				 assert Staff.first, @staff
				end

				should "assign correct user and organization" do
					assert_equal Staff.first, @staff 
				end 

				should "return the correct user and organization" do
					assert users(:testUser1).staff, @staff.user
					assert users(:testUser1).staff, @staff.organization 
				end	

				should "return the correct organization when calling organization.staff" do
					assert organizations(:testOrg1).staff, @staff.organization
				end
	end


	context "creating a staff with user_id and organization_id" do
		setup do
			@staff_1 = Staff.create user_id: users(:testUser1).id, organization_id: organizations(:testOrg1).id
			@staff_2 = Staff.create user_id: users(:testUser2).id, organization_id: organizations(:testOrg1).id
		end
			should "create a staff without raising an exception" do
					assert_nothing_raised do
						@staff_1
					end	
				end
				
				should "create a user.staff" do
				 assert Staff.first, @staff_1
				end
		
				should "assign correct user and organization" do
					assert_equal Staff.first, @staff_1 
				end 

				should "return the correct user" do
					assert users(:testUser1).staff, @staff_1.user
			  end
			  
			  should "return the correct organization" do
			  	assert users(:testUser1).staff, @staff_1.organization
			  end

			  should "return the correct user when calling organization.staff to find @staff_1" do
			  	assert organizations(:testOrg1).staff, @staff_1
			  end 

			  should "return the correct user when calling organization.staff to find @staff_2" do
			  	assert organizations(:testOrg1).staff, @staff_2
			  end 
			  
			  should "return the correct organization when calling organization.staff" do
			  	assert organizations(:testOrg1).staff, @staff_1.organization
			  end	
				
				should "assign correct user_id" do
					assert_equal users(:testUser1).staff.user_id, @staff_1.user_id
				end	

				should "assign correct organization_id" do
					assert_equal users(:testUser1).staff.organization_id, @staff_1.organization_id
				end	
	end


	context "a user creating staff relationships at two organizations" do
		setup do 
			@staff_1 = Staff.create user: users(:testUser1), organization: organizations(:testOrg1)
		end
			should "raise a RuntimeError" do
				assert_raises RuntimeError do
					@staff_2 = Staff.create user: users(:testUser1), organization: organizations(:testOrg2)
				end	
			end
	end

	




 	
end #end class StaffTest
