require 'test_helper'

class DeviceSubContentsControllerTest < ActionController::TestCase
  setup do
    @device_sub_content = device_sub_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:device_sub_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device_sub_content" do
    assert_difference('DeviceSubContent.count') do
      post :create, device_sub_content: {  }
    end

    assert_redirected_to device_sub_content_path(assigns(:device_sub_content))
  end

  test "should show device_sub_content" do
    get :show, id: @device_sub_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device_sub_content
    assert_response :success
  end

  test "should update device_sub_content" do
    patch :update, id: @device_sub_content, device_sub_content: {  }
    assert_redirected_to device_sub_content_path(assigns(:device_sub_content))
  end

  test "should destroy device_sub_content" do
    assert_difference('DeviceSubContent.count', -1) do
      delete :destroy, id: @device_sub_content
    end

    assert_redirected_to device_sub_contents_path
  end
end
