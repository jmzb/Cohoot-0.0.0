class FollowUser < ActiveRecord::Base

	belongs_to :user
	belongs_to :follower, class_name: "User", foreign_key: "user_id"
	belongs_to :followed, class_name: "User", foreign_key: "followed_id"

  validates_presence_of :user_id
	validates_presence_of :followed_id


#	after_destroy :delete_follower_connect!


# a class method, creates two instances of follow_user, accessible to both users
	def self.follow_action(user1, user2)
		transaction do	
			following_a = create(user: user1, follower: user1, followed: user2)
			#following_a = create(user: user1, followed: user2) 
			#followed_by = create(user: user2, follower: user1, followed: user2)
			#followed_by = create(user: user2, follower: user1)
		end	
	end	

#grabs the inverse of the follower-followed relationship; that is, the followed_by instance
#	def follower_connect  
#		self.class.where({user_id: followed_id, followed_id: user_id}).first
#	end	
#
#	def delete_follower_connect!
#		follower_connect.delete
#	end	
#
#	def create 
#		follow_user.create(follow_user_params)
#		follower.create(follower_params) #not sure how to handle these params
#		followed.create(followed_params) #not sure how to handle these params
#	end
#
#	def follower_params
#		params.require(:follower).permit(:follower)
#	end	
#
#	def followed_params
#		params.require(:followed).permit(:followed)
#	end

end