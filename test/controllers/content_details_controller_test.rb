require 'test_helper'

class ContentDetailsControllerTest < ActionController::TestCase
  setup do
    @content_detail = content_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_detail" do
    assert_difference('ContentDetail.count') do
      post :create, content_detail: {  }
    end

    assert_redirected_to content_detail_path(assigns(:content_detail))
  end

  test "should show content_detail" do
    get :show, id: @content_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_detail
    assert_response :success
  end

  test "should update content_detail" do
    patch :update, id: @content_detail, content_detail: {  }
    assert_redirected_to content_detail_path(assigns(:content_detail))
  end

  test "should destroy content_detail" do
    assert_difference('ContentDetail.count', -1) do
      delete :destroy, id: @content_detail
    end

    assert_redirected_to content_details_path
  end
end
