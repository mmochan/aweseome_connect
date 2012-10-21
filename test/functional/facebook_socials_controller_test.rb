require 'test_helper'

class FacebookSocialsControllerTest < ActionController::TestCase
  setup do
    @facebook_social = facebook_socials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facebook_socials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facebook_social" do
    assert_difference('FacebookSocial.count') do
      post :create, facebook_social: { email: @facebook_social.email, password: @facebook_social.password, user: @facebook_social.user }
    end

    assert_redirected_to facebook_social_path(assigns(:facebook_social))
  end

  test "should show facebook_social" do
    get :show, id: @facebook_social
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facebook_social
    assert_response :success
  end

  test "should update facebook_social" do
    put :update, id: @facebook_social, facebook_social: { email: @facebook_social.email, password: @facebook_social.password, user: @facebook_social.user }
    assert_redirected_to facebook_social_path(assigns(:facebook_social))
  end

  test "should destroy facebook_social" do
    assert_difference('FacebookSocial.count', -1) do
      delete :destroy, id: @facebook_social
    end

    assert_redirected_to facebook_socials_path
  end
end
