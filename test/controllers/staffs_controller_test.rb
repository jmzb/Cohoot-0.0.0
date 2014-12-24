require 'test_helper'

class StaffsControllerTest < ActionController::TestCase

# SHOULDA ActionController MATCHERS
   # filter_param 		#tests parameter filtering configuration.

   # redirect_to 			#tests that an action redirects to a certain location.
   	#context 'GET #show' do
      # setup { get :show }
      #
      # should redirect_to { posts_path }
      # should redirect_to(action: :index)
    # end

   # render_template 	#tests that an action renders a template.
   # render_with_layout 	#tests that an action is rendereed with a certain layout.
   # rescue_from 			#tests usage of the rescue_from macro.
   # respond_with 		#tests that an action responds with a certain status code.

   # route 						#tests your routes.
   	#		should route(:get, '/posts').
    # 		to(controller: :posts, action: :index)

   # set_session 			#makes assertions on the session hash.
   # set_the_flash 		#makes assertions on the flash hash.

 
  	

  context "for #new method" do 
  	context "not being logged in" do
  		setup { get :new}

  		should "respond with a redirect" do 
  			assert_response :redirect 
  		end	
  	end

  	context "being logged in" do 
  		setup do
  			sign_in FactoryGirl.create(:user)
  		end

  		should "get #new page and return success" do
  			get :new
  			assert_response :success
  		end	

  	end	 

 	end #end context #new method



end 
