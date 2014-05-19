class FollowUserController < ApplicationController
	before_filter :authenticate_user!, only: [:new]

	def new
	 
		if params[:followed_id] 
			@follower = current_user #seems to be broken, getting no method error
			@followed = User.find(params[:followed_id]) #this is probably ok
			@follow_user = FollowUser.new(followed: @followed, follower: @follower) #this is probably ok
		else
			flash[:error] = "Uh oh, we couldn't find the account you were looking to follow."
		end		

		rescue ActiveRecord::RecordNotFound
			render file: 'public/404', status: :not_found	

	end	

end
