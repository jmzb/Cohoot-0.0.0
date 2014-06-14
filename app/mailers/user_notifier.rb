class UserNotifier < ActionMailer::Base
  default from: "from@example.com"


  def account_confirmation(user.id)
  	# need to look at devise to make sure this is the best way to go about this...
  	# https://github.com/plataformatec/devise/wiki/How-To:-Use-custom-mailer
  	# setup devise mailer in config/initializers/devise.rb
  end	


  def new_private_message(user.id)
  	# a user has a new message from another user	
  end	

  


end
