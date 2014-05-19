require 'test_helper'

class CampaignsControllerTest < ActionController::TestCase
  setup do
    @campaign = campaigns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campaigns)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render new page when logged in" do
    sign_in users(:testUser1)
    get :new
    assert_response :success
  end

  test "should be logged in to post a campaign" do
    post :create, campaign: {content: "hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path

  end  

  test "should create campaign when logged in" do
    sign_in users(:testUser1)
    assert_difference('Campaign.count') do
      post :create, campaign: { content: @campaign.content, tstmp: @campaign.tstmp }
    end

    assert_redirected_to campaign_path(assigns(:campaign))
  end

  test "should create campaign for the current user when logged in" do
    sign_in users(:testUser1)
    assert_difference('Campaign.count') do
      post :create, campaign: { content: @campaign.content, tstmp: @campaign.tstmp, user_id: users(:testUser2).id }
    end
    assert_redirected_to campaign_path(assigns(:campaign))
    assert_equal assigns(:status).user_id, users(:testUser1).id
  end


  test "should show campaign" do
    get :show, id: @campaign
    assert_response :success
  end

  test "should be redirected from edit when not logged in" do
   get :edit, id: @campaign
   assert_response :redirect
   assert_redirected_to new_user_session_path
  end  

  test "should get edit when logged in" do
    sign_in users(:testUser1)
    get :edit, id: @campaign
    assert_response :success
  end

  test "should be redirected from update when not logged in" do
    patch :update, id: @campaign, campaign: { content: @campaign.content, tstmp: @campaign.tstmp }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end  

  test "should update campaign when loggined in" do
    sign_in users(:testUser1)
    patch :update, id: @campaign, campaign: { content: @campaign.content, tstmp: @campaign.tstmp }
    assert_redirected_to campaign_path(assigns(:campaign))
  end


  test "should update campaign for current user when loggined in" do
      sign_in users(:testUser1)
      patch :update, id: @campaign
      assert_redirected_to campaign_path(assigns(:campaign))
      assert_equal assigns(:status).user_id, users(:testUser1).id
    end

  test "should not update campaign when nothing has changed" do
      sign_in users(:testUser1)
      patch :update, id: @campaign, campaign: { content: @campaign.content, tstmp: @campaign.tstmp, user_id: users(:testUser2).id }
      assert_redirected_to campaign_path(assigns(:campaign))
      assert_equal assigns(:status).user_id, users(:testUser1).id
    end  




  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete :destroy, id: @campaign
    end

    assert_redirected_to campaigns_path
  end
end
