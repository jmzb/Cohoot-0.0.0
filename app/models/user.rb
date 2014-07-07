class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  include ActiveModel::ForbiddenAttributesProtection  
  has_one :staff
  has_one :organization, through: :staff

  has_many :programs, through: :organization, source: :staff
  has_many :locations, through: :organization, source: :staff
  
  has_many :campaigns

  #for following users
  has_many :follow_users
  has_many :followers, through: :follow_users  #this would be user in "user follows userA"
  has_many :followeds, through: :follow_users  #this would be userA in "user follows userA"
  has_many :reverse_user_rels, class_name: "FollowUser", foreign_key: "followed_id", dependent: :destroy
  has_many :followed_bys, through: :reverse_user_rels, source: :follower #this would be user in "userB follows user"

  #for following organizations
  # has_many :follow_orgs
  # has_many :followed_orgs, through: :follow_orgs
  # has_many :reverse_org_rel, foreign_key: "followed_id", class_name: "FollowOrg", dependent: :destroy
  # has_many :followers_org_r, through: :reverse_org_rel, source: :follower_org

  #for following programs
  # has_many :follow_progs
  # has_many :followed_progs, through: :follow_progs
  # has_many :reverse_prog_rel, foreign_key: "followed_id", class_name: "FollowProg", dependent: :destroy
  # has_many :followers_prog_r, through: :reverse_prog_rel, source: :follower_prog

  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates_acceptance_of :terms_of_service

  def full_name
  	first_name + " " + last_name
  end

  

end
