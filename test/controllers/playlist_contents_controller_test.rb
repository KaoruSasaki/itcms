require 'test_helper'

class PlaylistContentsControllerTest < ActionController::TestCase
  setup do
    @playlist_content = playlist_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playlist_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playlist_content" do
    assert_difference('PlaylistContent.count') do
      post :create, playlist_content: {  }
    end

    assert_redirected_to playlist_content_path(assigns(:playlist_content))
  end

  test "should show playlist_content" do
    get :show, id: @playlist_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playlist_content
    assert_response :success
  end

  test "should update playlist_content" do
    patch :update, id: @playlist_content, playlist_content: {  }
    assert_redirected_to playlist_content_path(assigns(:playlist_content))
  end

  test "should destroy playlist_content" do
    assert_difference('PlaylistContent.count', -1) do
      delete :destroy, id: @playlist_content
    end

    assert_redirected_to playlist_contents_path
  end
end
