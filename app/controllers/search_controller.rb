class SearchController < ApplicationController
  



  def index
      if user_signed_in?
      @organization = current_user.staff
    end 

    @search = DemoSearch.new
    @results = @search.search(params[:q])
  

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

	  	#not sure about this rescue code!
	  	rescue Elasticsearch::Transport::Transport::Errors::BadRequest => e
	    	@results = []
	    	@error = e.message.match(/QueryParsingException\[([^;]+)\]/).try(:[], 1)
	  end	


end
