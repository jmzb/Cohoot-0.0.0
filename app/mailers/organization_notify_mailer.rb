class OrganizationNotifyMailer < ActionMailer::Base
  default from: "from@example.com"




  def new_staff_member_request(staff_id)  #needs to be tested -- not working
  	staff = Staff.find(staff_id)

  	@user = staff.user
  	@organization = staff.organization
  	@confirmed_staff = @organization.staff.where(state: "confirmed").load

  	@confirmed_staff.each do |m|
  		mail to: @confirmed_staff.email,
  			subject: "#{@user.full_name} just connected on Cohoot!"
  	end
  end	



end
