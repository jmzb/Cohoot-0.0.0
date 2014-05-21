class FollowUser < ActiveRecord::Base

	belongs_to :user
	belongs_to :follower, class_name: "User", foreign_key: "user_id"
	belongs_to :followed, class_name: "User", foreign_key: "followed_id"
end
