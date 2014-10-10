require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:organization)

  should have_many(:users).through(:organization)
  should have_many(:campaigns).through(:users)
  should have_many(:locations).through(:organization)

  should have_many(:program_activities)
end
