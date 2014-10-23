require 'test_helper'

class PrincipalEstablecsControllerTest < ActionController::TestCase
  setup do
    @principal_establec = principal_establecs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:principal_establecs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create principal_establec" do
    assert_difference('PrincipalEstablec.count') do
      post :create, principal_establec: { calendario: @principal_establec.calendario, correo: @principal_establec.correo, dane_establec: @principal_establec.dane_establec, direccion: @principal_establec.direccion, jornada: @principal_establec.jornada, localidad: @principal_establec.localidad, nombre: @principal_establec.nombre, rector: @principal_establec.rector, telefono: @principal_establec.telefono, zona: @principal_establec.zona }
    end

    assert_redirected_to principal_establec_path(assigns(:principal_establec))
  end

  test "should show principal_establec" do
    get :show, id: @principal_establec
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @principal_establec
    assert_response :success
  end

  test "should update principal_establec" do
    put :update, id: @principal_establec, principal_establec: { calendario: @principal_establec.calendario, correo: @principal_establec.correo, dane_establec: @principal_establec.dane_establec, direccion: @principal_establec.direccion, jornada: @principal_establec.jornada, localidad: @principal_establec.localidad, nombre: @principal_establec.nombre, rector: @principal_establec.rector, telefono: @principal_establec.telefono, zona: @principal_establec.zona }
    assert_redirected_to principal_establec_path(assigns(:principal_establec))
  end

  test "should destroy principal_establec" do
    assert_difference('PrincipalEstablec.count', -1) do
      delete :destroy, id: @principal_establec
    end

    assert_redirected_to principal_establecs_path
  end
end
