require 'test_helper'

class SubContentsControllerTest < ActionController::TestCase
  setup do
    @sub_content = sub_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_content" do
    assert_difference('SubContent.count') do
      post :create, sub_content: {  }
    end

    assert_redirected_to sub_content_path(assigns(:sub_content))
  end

  test "should show sub_content" do
    get :show, id: @sub_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_content
    assert_response :success
  end

  test "should update sub_content" do
    patch :update, id: @sub_content, sub_content: {  }
    assert_redirected_to sub_content_path(assigns(:sub_content))
  end

  test "should destroy sub_content" do
    assert_difference('SubContent.count', -1) do
      delete :destroy, id: @sub_content
    end

    assert_redirected_to sub_contents_path
  end
end
