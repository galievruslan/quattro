require 'test_helper'

class ProjectPhotosControllerTest < ActionController::TestCase
  setup do
    @project_photo = project_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_photo" do
    assert_difference('ProjectPhoto.count') do
      post :create, project_photo: { default: @project_photo.default, image_name: @project_photo.image_name, image_uid: @project_photo.image_uid }
    end

    assert_redirected_to project_photo_path(assigns(:project_photo))
  end

  test "should show project_photo" do
    get :show, id: @project_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_photo
    assert_response :success
  end

  test "should update project_photo" do
    put :update, id: @project_photo, project_photo: { default: @project_photo.default, image_name: @project_photo.image_name, image_uid: @project_photo.image_uid }
    assert_redirected_to project_photo_path(assigns(:project_photo))
  end

  test "should destroy project_photo" do
    assert_difference('ProjectPhoto.count', -1) do
      delete :destroy, id: @project_photo
    end

    assert_redirected_to project_photos_path
  end
end
