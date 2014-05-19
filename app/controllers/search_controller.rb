class SearchController < ApplicationController
  def index
  	if user_signed_in?
  		@organization = current_user.organization
  	end	
  end
end
