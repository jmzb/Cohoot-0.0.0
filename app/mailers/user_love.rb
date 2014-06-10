class UserLove < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email_existing_org(user.id)  #not sure if my argument is correct...
  	# a user just signed up and confirmed
  # 	user = User.find(:id)

  # 	@user = ...
  # 	@organization = 
  #
  end	

  def welcome_email_new_org(user.id)
  	# a user just signed up and confirmed
  end

  def first_week_thanks(user.id)
  	# a user has been signed up for one week
  end	

  def increase_in_activity_thanks(user.id)
  	# a user has increased their activity by X ammount over 1 month
  end
  
  def decrease_in_activity_sad(user.id)
  	# a user has decreased their activity by x ammount over 3 months
  end	

  def first_year_thanks(user.id)
  	# user has been signed up for one year
  end	

  def shindig_invite(user.id)
  	# a user has been invited to a choot shindig
  end	

  	
end
