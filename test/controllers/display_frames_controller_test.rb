require 'test_helper'

class DisplayFramesControllerTest < ActionController::TestCase
  setup do
    @display_frame = display_frames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:display_frames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create display_frame" do
    assert_difference('DisplayFrame.count') do
      post :create, display_frame: {  }
    end

    assert_redirected_to display_frame_path(assigns(:display_frame))
  end

  test "should show display_frame" do
    get :show, id: @display_frame
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @display_frame
    assert_response :success
  end

  test "should update display_frame" do
    patch :update, id: @display_frame, display_frame: {  }
    assert_redirected_to display_frame_path(assigns(:display_frame))
  end

  test "should destroy display_frame" do
    assert_difference('DisplayFrame.count', -1) do
      delete :destroy, id: @display_frame
    end

    assert_redirected_to display_frames_path
  end
end
