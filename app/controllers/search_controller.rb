class SearchController < ApplicationController
  def index
  	if user_signed_in?
  		@organization = current_user.staff
  	end	
  end	
end
