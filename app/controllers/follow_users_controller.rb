class FollowUsersController < ApplicationController
	before_filter :authenticate_user!

	def index
		#this only works for the current user. For other users use SHOW
		@user = current_user
		@follow_users = @user.follow_users.includes(:followed, :follower).all
	end	


	def new
		if params[:followed_id] 
			@follower = User.find(current_user)
			@followed = User.find(params[:followed_id]) 
			@follow_user = @follower.follow_users.new(followed: @followed)
		else
			flash[:error] = "Uh oh, we couldn't find the person you were looking to follow."
		end		

		rescue ActiveRecord::RecordNotFound
			render file: 'public/404', status: :not_found
	end	


	def create
		if params[:followed_id]
			@follower = User.find(current_user) 
			@followed = User.find(params[:followed_id])
			@follow_user = FollowUser.follow_action(@follower, @followed)
			@follow_user.save
				flash[:success] = "Yeah! You're following #{@followed.full_name}"
				redirect_to profile_page_path(@followed) 	
		else
		 	flash[:error] = "Uh oh, we broke our own site :-( and we couldn't find the person you were looking to follow."
		 	redirect_to root_path
		end	
	end	


	def show
		#for all users other than current user
	end
	
	def edit
		@follow_user = current_user.follow_users.find(params[:id])
    	@followed = @follow_user.followed
	end

	def destroy
		@follow_user = current_user.follow_users.find(params[:id])
		@follow_user.destroy
		redirect_to follow_users_path
	end	


private 
	def follow_user_params
		params.require(:follow_user).permit(:user_id, :followed_id, :follower, :followed)
	end


end
