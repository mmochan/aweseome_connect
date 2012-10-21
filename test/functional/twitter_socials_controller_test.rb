require 'test_helper'

class TwitterSocialsControllerTest < ActionController::TestCase
  setup do
    @twitter_social = twitter_socials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitter_socials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitter_social" do
    assert_difference('TwitterSocial.count') do
      post :create, twitter_social: { email: @twitter_social.email, password: @twitter_social.password, user: @twitter_social.user }
    end

    assert_redirected_to twitter_social_path(assigns(:twitter_social))
  end

  test "should show twitter_social" do
    get :show, id: @twitter_social
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @twitter_social
    assert_response :success
  end

  test "should update twitter_social" do
    put :update, id: @twitter_social, twitter_social: { email: @twitter_social.email, password: @twitter_social.password, user: @twitter_social.user }
    assert_redirected_to twitter_social_path(assigns(:twitter_social))
  end

  test "should destroy twitter_social" do
    assert_difference('TwitterSocial.count', -1) do
      delete :destroy, id: @twitter_social
    end

    assert_redirected_to twitter_socials_path
  end
end
