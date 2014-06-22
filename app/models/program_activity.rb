class ProgramActivity < ActiveRecord::Base
	belongs_to :program

	#NEED TO WRITES TESTS FOR THESE VALIDATIONS!!
	#validates :activity_name, presence :true, length: {3..45}
	#validates :activity_short_desc, lenght: {3..150}
	#validates_associated :program

end
