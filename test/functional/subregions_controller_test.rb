require 'test_helper'

class SubregionsControllerTest < ActionController::TestCase
  setup do
    @subregion = subregions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subregions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subregion" do
    assert_difference('Subregion.count') do
      post :create, subregion: { cod_subregion: @subregion.cod_subregion, nombre_subregion: @subregion.nombre_subregion }
    end

    assert_redirected_to subregion_path(assigns(:subregion))
  end

  test "should show subregion" do
    get :show, id: @subregion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subregion
    assert_response :success
  end

  test "should update subregion" do
    put :update, id: @subregion, subregion: { cod_subregion: @subregion.cod_subregion, nombre_subregion: @subregion.nombre_subregion }
    assert_redirected_to subregion_path(assigns(:subregion))
  end

  test "should destroy subregion" do
    assert_difference('Subregion.count', -1) do
      delete :destroy, id: @subregion
    end

    assert_redirected_to subregions_path
  end
end
