require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    should have_many(:staff)
    should have_many(:users).through(:staff)
    should have_many(:campaigns).through(:users)

  	should have_many(:programs)
  	should have_many(:program_activities).through(:programs)
  	
  	should have_many(:locations)


end
