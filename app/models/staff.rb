class Staff < ActiveRecord::Base
	belongs_to :organization
	belongs_to :user

	validates_presence_of :user_id
	validates_presence_of :organization_id
	before_create :ensure_not_moonlighting

	scope :staff_member, -> { with_state(:confirmed) or with_state(:initial_staff)}

	state_machine :state, :initial => :pending do
			#event :join_staff do
			#	transition :pending => :confirmed
			#end	

			#event :first_staff do
			#	transition :pending => :initial_staff
			#end

			#event :reject_staff do
			# transition :pending => same, :confirmed => :pending
			# end
	end	

	def ensure_not_moonlighting #ensures a user can't be staff at more than one organization
		if Staff.where(user_id: user_id).exists?
		 	raise "You are already on staff at an organization"
		end 
		true	
	end	

end
