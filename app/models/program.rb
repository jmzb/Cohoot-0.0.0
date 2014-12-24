class Program < ActiveRecord::Base

	belongs_to :organization

	has_many :users, through: :organization 
	has_many :campaigns, through: :users
	has_many :locations, through: :organization
	has_many :program_activities



	#NEED TO WRITES TESTS FOR THESE VALIDATIONS!!
#	valdiates :prog_name, presence :true, length: {1..45, message: "Oh-man-oh-man, your program name must be no more than 45 characters"}
#	validates :ideal_candiate, lenght: {1..150, message: "Oh-man-oh-man, your description must be no more than 150 characters"}
#	validates :initial_condition, length: {1..150, message: "Oh-man-oh-man, your description must be no more than 150 characters"}
#	validates :goal_condition, length: {1..150, message: "Oh-man-oh-man, your description must be no more than 150 characters"}
#	validates_associated :organization
end
