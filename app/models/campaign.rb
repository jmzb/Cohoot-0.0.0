class Campaign < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	
	validates :content, presence: true, length: { minimum: 2 }
	validates :user_id, presence: true

end
