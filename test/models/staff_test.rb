require 'test_helper'

class StaffTest < ActiveSupport::TestCase
 	should belong_to(:organization)
 	should belong_to(:user)

 	should validate_presence_of(:user_id)
# 	should validate_uniqueness_of(:user_id)
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
			@staff = Staff.create user_id: users(:testUser1).id, organization_id: organizations(:testOrg1).id
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
			  
			  should "return the correct user and organization when calling organization.staff" do
			  	assert organizations(:testOrg1).staff, @staff.organization
			  end 
			  	
				should "assign correct user_id and organization_id" do
					assert_equal users(:testUser1).staff.user_id, @staff.user_id
					assert_equal users(:testUser1).staff.organization_id, @staff.organization_id
				end	

	end

  #####
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


	#####
 	context "creating staff relationships for organizations with user and organization objects" do 
 		setup do
 		end	

 			should "create a staff without raising an exception" do
			end
			
			should "create a user.staff" do
			end

			should "assign correct user and organization" do
			end	
 	end	


 	
end #end class StaffTest
