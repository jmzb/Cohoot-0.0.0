class StaffsController < ApplicationController
	before_action :authenticate_user!

	def new
		@user = current_user
		@organizations = Organization.all 
		@staff = Staff.new(user_id: @user.id)
	end

	def create
		@user = current_user
		organization_id = params[:organization_id]
		@organization = Organization.find_by(organization_id)
		@staff = Staff.create(user_id: @user.id, organization_id: @organization.id)
		@staff.save 
			redirect_to root_path
			flash[:success] = "Cool"
	end	


end
