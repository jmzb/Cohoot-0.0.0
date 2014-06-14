class ProgramActivities < ApplicationController

  def index
  	@program_activites = ProgramActivity.all 
  end	

end	