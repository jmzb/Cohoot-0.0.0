class ProfilesController < ApplicationController


 def index #will be scoped to current_user only: ediable, etc
 end	

  def show #for users other than current user

 	@user = User.find(params[:id])
  		if @user
  			@organization = @user.staff.organization
  			@campaigns = @user.campaigns.load
  			
        @follow_users = @user.follow_users.includes(:followed, :follower).all
  			  if @follow_users 
  				  @followeds = @user.followeds.all
            @followers = @user.followed_bys.all
  			  end	

  			render action: :show
  		else	
			render file: 'public/404', status: 404, formats: [:html]
		end	

  end
end
