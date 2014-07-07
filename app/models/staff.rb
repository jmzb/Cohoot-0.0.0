class Staff < ActiveRecord::Base
	belongs_to :organization
	belongs_to :user

	validates_presence_of :user_id
	validates_presence_of :organization_id
	before_create :ensure_not_moonlighting
	after_create :confirm_join_staff


	scope :staff_member, -> { with_state(:confirmed) }
	scope :pending, -> { with_state(:pending) }
	#scope :staff_member, -> { with_state(:confirmed) or with_state(:initial_staff)} #this is not yet tested, might be wrong
	# users.where(users[:name].eq('bob').or(users[:age].lt(25)))


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

			state :confirmed do

  		end	
	end	

  

	def ensure_not_moonlighting #ensures a user can't be staff at more than one organization
		if Staff.where(user_id: user_id).exists?
		 	raise "You are already on staff at an organization"
		end 
		true	
	end	

	def confirm_join_staff #asks existing staff to verify new user is actually staff
		if Staff.where(state: "confirmed")  #needs to be fixed--it's Staff where *the organization* and state are correct
			OrganizationNotifyMailer.new_staff_member_request(id).deliver
		end	
	end	




end
