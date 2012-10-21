require 'test_helper'

class AppdotnetSocialsControllerTest < ActionController::TestCase
  setup do
    @appdotnet_social = appdotnet_socials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appdotnet_socials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appdotnet_social" do
    assert_difference('AppdotnetSocial.count') do
      post :create, appdotnet_social: { email: @appdotnet_social.email, password: @appdotnet_social.password, user: @appdotnet_social.user }
    end

    assert_redirected_to appdotnet_social_path(assigns(:appdotnet_social))
  end

  test "should show appdotnet_social" do
    get :show, id: @appdotnet_social
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appdotnet_social
    assert_response :success
  end

  test "should update appdotnet_social" do
    put :update, id: @appdotnet_social, appdotnet_social: { email: @appdotnet_social.email, password: @appdotnet_social.password, user: @appdotnet_social.user }
    assert_redirected_to appdotnet_social_path(assigns(:appdotnet_social))
  end

  test "should destroy appdotnet_social" do
    assert_difference('AppdotnetSocial.count', -1) do
      delete :destroy, id: @appdotnet_social
    end

    assert_redirected_to appdotnet_socials_path
  end
end
