require 'test_helper'

class ActionRegistrationsControllerTest < ActionController::TestCase
  setup do
    @action_registration = action_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_registration" do
    assert_difference('ActionRegistration.count') do
      post :create, action_registration: { customer_id: @action_registration.customer_id, vehicle_id: @action_registration.vehicle_id }
    end

    assert_redirected_to action_registration_path(assigns(:action_registration))
  end

  test "should show action_registration" do
    get :show, id: @action_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @action_registration
    assert_response :success
  end

  test "should update action_registration" do
    put :update, id: @action_registration, action_registration: { customer_id: @action_registration.customer_id, vehicle_id: @action_registration.vehicle_id }
    assert_redirected_to action_registration_path(assigns(:action_registration))
  end

  test "should destroy action_registration" do
    assert_difference('ActionRegistration.count', -1) do
      delete :destroy, id: @action_registration
    end

    assert_redirected_to action_registrations_path
  end
end
