class ResultsController < ApplicationController
  



  def index
      if user_signed_in?
      @organization = current_user.staff
    end 

    @search = DemoSearch.new
    @results = @search.search(params[:q])
    @prog_org = Organization.find_by(params[:id]) #this might not actually work, could be pulling current_user org id
   # @org = Organization.load(params[:q]).records


    #not sure about this rescue code!
    rescue Elasticsearch::Transport::Transport::Errors::BadRequest => e
      @results = []
      @error = e.message.match(/QueryParsingException\[([^;]+)\]/).try(:[], 1)  
  end	



	  def show
	  	if user_signed_in?
	  		@organization = current_user.staff
	  	end	

	  	@search = DemoSearch.new
	  	@results = @search.search(params[:q])
  		@program = Program.load(params[:q]).records
      @org = Organization.load(params[:q]).records

	  	#not sure about this rescue code!
	  	rescue Elasticsearch::Transport::Transport::Errors::BadRequest => e
	    	@results = []
	    	@error = e.message.match(/QueryParsingException\[([^;]+)\]/).try(:[], 1)
	  end	


end
