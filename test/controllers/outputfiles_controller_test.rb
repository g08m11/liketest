require 'test_helper'

class OutputfilesControllerTest < ActionController::TestCase
  setup do
    @outputfile = outputfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outputfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outputfile" do
    assert_difference('Outputfile.count') do
      post :create, outputfile: { file: @outputfile.file, task_id: @outputfile.task_id }
    end

    assert_redirected_to outputfile_path(assigns(:outputfile))
  end

  test "should show outputfile" do
    get :show, id: @outputfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outputfile
    assert_response :success
  end

  test "should update outputfile" do
    patch :update, id: @outputfile, outputfile: { file: @outputfile.file, task_id: @outputfile.task_id }
    assert_redirected_to outputfile_path(assigns(:outputfile))
  end

  test "should destroy outputfile" do
    assert_difference('Outputfile.count', -1) do
      delete :destroy, id: @outputfile
    end

    assert_redirected_to outputfiles_path
  end
end
