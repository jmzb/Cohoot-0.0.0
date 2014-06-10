class UserLowdown < ActionMailer::Base
  default from: "from@example.com"

  def daily_activity_digest
  	#activity on the user's loop & reccomendations
  end	

  def weekly_activity_digest
  	#activity on the user's loop & reccomendations
  end

  def monthly_activity_digest
  	#activity on the user's loop & reccomendations
  end
  	
  def weekly_upcoming_events
  	#event reccomendations
  end 

  def monthly_upcoming_events
  	#event reccomendations
  end


end
