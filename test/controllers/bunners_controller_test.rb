require 'test_helper'

class BunnersControllerTest < ActionController::TestCase
  setup do
    @bunner = bunners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bunners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bunner" do
    assert_difference('Bunner.count') do
      post :create, bunner: { avatar: @bunner.avatar }
    end

    assert_redirected_to bunner_path(assigns(:bunner))
  end

  test "should show bunner" do
    get :show, id: @bunner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bunner
    assert_response :success
  end

  test "should update bunner" do
    patch :update, id: @bunner, bunner: { avatar: @bunner.avatar }
    assert_redirected_to bunner_path(assigns(:bunner))
  end

  test "should destroy bunner" do
    assert_difference('Bunner.count', -1) do
      delete :destroy, id: @bunner
    end

    assert_redirected_to bunners_path
  end
end
