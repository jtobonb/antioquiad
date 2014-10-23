require 'test_helper'

class EstablecPpalsControllerTest < ActionController::TestCase
  setup do
    @establec_ppal = establec_ppals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:establec_ppals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create establec_ppal" do
    assert_difference('EstablecPpal.count') do
      post :create, establec_ppal: { calendario: @establec_ppal.calendario, correo: @establec_ppal.correo, dane_establec: @establec_ppal.dane_establec, direccion: @establec_ppal.direccion, jornada: @establec_ppal.jornada, localidad: @establec_ppal.localidad, nombre: @establec_ppal.nombre, rector: @establec_ppal.rector, telefono: @establec_ppal.telefono, zona: @establec_ppal.zona }
    end

    assert_redirected_to establec_ppal_path(assigns(:establec_ppal))
  end

  test "should show establec_ppal" do
    get :show, id: @establec_ppal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @establec_ppal
    assert_response :success
  end

  test "should update establec_ppal" do
    put :update, id: @establec_ppal, establec_ppal: { calendario: @establec_ppal.calendario, correo: @establec_ppal.correo, dane_establec: @establec_ppal.dane_establec, direccion: @establec_ppal.direccion, jornada: @establec_ppal.jornada, localidad: @establec_ppal.localidad, nombre: @establec_ppal.nombre, rector: @establec_ppal.rector, telefono: @establec_ppal.telefono, zona: @establec_ppal.zona }
    assert_redirected_to establec_ppal_path(assigns(:establec_ppal))
  end

  test "should destroy establec_ppal" do
    assert_difference('EstablecPpal.count', -1) do
      delete :destroy, id: @establec_ppal
    end

    assert_redirected_to establec_ppals_path
  end
end
