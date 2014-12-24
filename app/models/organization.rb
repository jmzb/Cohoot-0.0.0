class Organization < ActiveRecord::Base

has_many :staff
has_many :users, through: :staff
has_many :campaigns, through: :users

# belongs_to :network
# belongs_to :collaboration

has_many :programs
has_many :program_activities, through: :programs

has_many :locations


end
