require 'elasticsearch/model'

class Program < ActiveRecord::Base
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
  mappings dynamic: 'false' do
    indexes :title, analyzer: 'english'
    indexes :text, analyzer: 'english'
  end
end




	belongs_to :organization

	has_many :users, through: :organization 
	has_many :campaigns, through: :users
	has_many :locations, through: :organization
	has_many :program_activities

  update_index('demo#program') { self } # specifying index, type and backreference
                                      # for updating after user save or destroy

	#NEED TO WRITES TESTS FOR THESE VALIDATIONS!!
#	valdiates :prog_name, presence :true, length: {1..45, message: "Oh-man-oh-man, your program name must be no more than 45 characters"}
#	validates :ideal_candiate, lenght: {1..150, message: "Oh-man-oh-man, your description must be no more than 150 characters"}
#	validates :initial_condition, length: {1..150, message: "Oh-man-oh-man, your description must be no more than 150 characters"}
#	validates :goal_condition, length: {1..150, message: "Oh-man-oh-man, your description must be no more than 150 characters"}
#	validates_associated :organization



# Delete the previous articles index in Elasticsearch
Program.__elasticsearch__.client.indices.delete index: Program.index_name rescue nil
 
# Create the new index with the new mapping
Program.__elasticsearch__.client.indices.create \
  index: Program.index_name,
  body: { settings: Program.settings.to_hash, mappings: Program.mappings.to_hash }


#for auto sync model with elastic search: Index all article records from the DB to Elasticsearch
Program.import 

end