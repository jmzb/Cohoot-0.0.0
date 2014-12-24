class UsersController < ApplicationController
	before_action :authenticate_user!
	
  def index
	@users = User.all
	@user = User.find_by_first_name(params[:id])
  end
end
