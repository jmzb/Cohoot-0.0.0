class ProfilesController < ApplicationController


 def index
 end	

  def show
 	@user = User.find(params[:id])
  		if @user
  			@organization = @user.organization
  			@campaigns = @user.campaigns.load
  			render action: :show
  		else	
			render file: 'public/404', status: 404, formats: [:html]
		end	

  end
end
