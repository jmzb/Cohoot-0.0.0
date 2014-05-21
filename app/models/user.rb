class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include ActiveModel::ForbiddenAttributesProtection  



  belongs_to :organization
  has_and_belongs_to_many :programs
  has_many :locations, through: :organization
  has_many :campaigns

#join-tables...verb-like database relationships...
  has_many :follow_users
  has_many :followers, through: :follow_users
  has_many :followeds, through: :follow_users

  # has_many :follow_orgs
  # has_many :following_orgs, through: :follow_orgs

  # has_many :follow_progs
  # has_many :following_progs, through: :follow_progs

  # has_many :follow_



  def full_name
  	first_name + " " + last_name
  end

  def fullname
    first_name + "_" + last_name
  end      

  validates :first_name, presence: true
  validates :last_name, presence: true
 

end
