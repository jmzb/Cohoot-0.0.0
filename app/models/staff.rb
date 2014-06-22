class Staff < ActiveRecord::Base
	belongs_to :organization
	belongs_to :user

	validates_presence_of :user_id
	#validates_uniqueness_of :user_id

	validates_presence_of :organization_id

	before_create :ensure_not_moonlighting
	# before_create validate: :not_double_counting
	#	after_destroy :delete_staff_relationship!

	def ensure_not_moonlighting #ensures a user can't be staff at more than one organization
		if Staff.where(user_id: user_id).exists?
			#if Staff.where(user_id: user_id).count > 2 #use something like this if the self.join_staff casues problems here...
		 	raise "You are already on staff at an organization"
		end 
		true	
	end	

	#def not_double_counting(organization, user) #ensures an organization can't double count a staff member
		# validate exists? organization.staff.user_id
		# if Organization.staff.user_id.exists?
		# 	 retunr an error/ don't create
		# else
		#   raise no exception
		# end  
	#end	

	#def self.join_staff(user, organization) # creates two instances of staff, accessible to both user and organization
	#	transaction do
	#	end	
	#end

	#def grab_staff_member #grabs the user.staff object with the organization.staff object
	#end	

	#def grab_organization #grabs the organization.staff object with the user.staff object

	#def delete_staff_relationship! #deletes both staff relationships
	#end
	



end
