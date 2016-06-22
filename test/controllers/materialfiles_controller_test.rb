require 'test_helper'

class MaterialfilesControllerTest < ActionController::TestCase
  setup do
    @materialfile = materialfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materialfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create materialfile" do
    assert_difference('Materialfile.count') do
      post :create, materialfile: { file: @materialfile.file, task_id: @materialfile.task_id }
    end

    assert_redirected_to materialfile_path(assigns(:materialfile))
  end

  test "should show materialfile" do
    get :show, id: @materialfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @materialfile
    assert_response :success
  end

  test "should update materialfile" do
    patch :update, id: @materialfile, materialfile: { file: @materialfile.file, task_id: @materialfile.task_id }
    assert_redirected_to materialfile_path(assigns(:materialfile))
  end

  test "should destroy materialfile" do
    assert_difference('Materialfile.count', -1) do
      delete :destroy, id: @materialfile
    end

    assert_redirected_to materialfiles_path
  end
end
