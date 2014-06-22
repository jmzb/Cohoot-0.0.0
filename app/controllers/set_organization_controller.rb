class SetOrganizationController < ApplicationController
  before_action :authenticate_user!
	def index 
		@staff = Staff.new
		@user = current_user
		@organization = Organization.all
	end	

end