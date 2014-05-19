class Program < ActiveRecord::Base
	
	belongs_to :organization
	has_and_belongs_to_many :users
	has_many :locations, through: :organizations
	has_many :campaigns, through: :users
end
