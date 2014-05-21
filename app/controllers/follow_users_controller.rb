class FollowUsersController < ApplicationController
	before_filter :authenticate_user!, only: [:new]

	def new
		if params[:followed_id] 
			@follower = current_user 
			@followed = User.find(params[:followed_id]) #unclear if this line of code works properly
		#	@follow_user = FollowUser.new(follower: @follower, followed: @followed) #unclear if this line of code is functional
			@follow_user = @follower.follow_users.new(followed: @followed)

		else
			flash[:error] = "Uh oh, we couldn't find the person you were looking to follow."
		end		

		rescue ActiveRecord::RecordNotFound
			render file: 'public/404', status: :not_found  #not working

	end	


	def create
		if params[:followed_id]
			@follower = current_user 
			@followed = User.find(params[:followed_id]) #unclear if this line of code works properly
			#@followed = User.where(id: params[:followed_id]).first #this code breaks the 404 somehow
		#	@follow_user = FollowUser.new(follower: @follower, followed: @followed) #NoMethodError: undefined method `follow_user'
			@follow_user = @follower.follow_users.new(followed: @followed) #ActiveRecord::UnknownAttributeError: unknown attribute: user_id
			@follow_user.save
				flash[:success] = "Yeah! You're following #{@followed.full_name}"
				redirect_to profile_page_path(@followed) 	
		else
		 	flash[:error] = "Uh oh, we broke our own site :-( and we couldn't find the person you were looking to follow."
		 	redirect_to root_path
		end	
	end	


end
