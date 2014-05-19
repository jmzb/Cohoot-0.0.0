class Organization < ActiveRecord::Base

has_many :users
has_many :programs, dependent: :destroy
has_many :locations, dependent: :destroy
has_many :campaigns, through: :users

end
