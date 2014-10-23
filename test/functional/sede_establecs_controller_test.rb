# -*- encoding : utf-8 -*-
require 'test_helper'

class SedeEstablecsControllerTest < ActionController::TestCase
  setup do
    @sede_establec = sede_establecs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sede_establecs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sede_establec" do
    assert_difference('SedeEstablec.count') do
      post :create, sede_establec: { calendario: @sede_establec.calendario, correo: @sede_establec.correo, dane_establec: @sede_establec.dane_establec, dane_sede: @sede_establec.dane_sede, direccion: @sede_establec.direccion, jornada: @sede_establec.jornada, localidad: @sede_establec.localidad, nombre: @sede_establec.nombre, telefono: @sede_establec.telefono, zona: @sede_establec.zona }
    end

    assert_redirected_to sede_establec_path(assigns(:sede_establec))
  end

  test "should show sede_establec" do
    get :show, id: @sede_establec
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sede_establec
    assert_response :success
  end

  test "should update sede_establec" do
    put :update, id: @sede_establec, sede_establec: { calendario: @sede_establec.calendario, correo: @sede_establec.correo, dane_establec: @sede_establec.dane_establec, dane_sede: @sede_establec.dane_sede, direccion: @sede_establec.direccion, jornada: @sede_establec.jornada, localidad: @sede_establec.localidad, nombre: @sede_establec.nombre, telefono: @sede_establec.telefono, zona: @sede_establec.zona }
    assert_redirected_to sede_establec_path(assigns(:sede_establec))
  end

  test "should destroy sede_establec" do
    assert_difference('SedeEstablec.count', -1) do
      delete :destroy, id: @sede_establec
    end

    assert_redirected_to sede_establecs_path
  end
end
