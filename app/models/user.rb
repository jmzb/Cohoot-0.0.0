class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #:confirmable

  include ActiveModel::ForbiddenAttributesProtection  
  has_one :staff
  has_one :organizations, through: :staff


#possible way to build the relationship between users and programs... 
  #has_many :program_teams                          #...might be a good place to use a class variable to scope?
  #has_many :programs, through: :program_teams

#another possible way to build the relationship between users and programs...
  has_many :programs, through: :organizations


#to define a user's location... either go through organization, programs, or create a direct join table...?  
  #failing
  has_many :locations, through: :organizations
  
  has_many :campaigns

  #for following users
  has_many :follow_users
  has_many :followers, through: :follow_users  #this would be user in "user follows userA"
  has_many :followeds, through: :follow_users  #this would be userA in "user follows userA"
  has_many :reverse_user_rels, class_name: "FollowUser", foreign_key: "followed_id", dependent: :destroy
  has_many :followed_bys, through: :reverse_user_rels, source: :follower #this would be user in "userB follows user"

  # for following organizations, note: an organization cannot follow anyone-organization inherits followeds from staff
  # when a user follows an organization the user follows posts from the org's posting staff
  # has_many :follow_orgs

  # for following programs, note: a program cannot follow anyone-program inherits followeds from staff
  # when a user follows a program the user follows posts from the programs's posting staff
  # has_many :follow_progs
 

  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates_acceptance_of :terms_of_service

  def full_name
  	first_name + " " + last_name
  end

  

end
