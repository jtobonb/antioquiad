# -*- encoding : utf-8 -*-
require 'test_helper'

class EstablecimientosControllerTest < ActionController::TestCase
  setup do
    @establecimiento = establecimientos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:establecimientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create establecimiento" do
    assert_difference('Establecimientos.count') do
      post :create, establecimiento: { calendario: @establecimiento.calendario, dane_establecimiento: @establecimiento.dane_establecimiento, direccion: @establecimiento.direccion, email: @establecimiento.email, id_municipio: @establecimiento.id_municipio, jornada: @establecimiento.jornada, localidad: @establecimiento.localidad, nombre: @establecimiento.nombre, telefono: @establecimiento.telefono, usuario: @establecimiento.usuario, zona: @establecimiento.zona }
    end

    assert_redirected_to establecimiento_path(assigns(:establecimiento))
  end

  test "should show establecimiento" do
    get :show, id: @establecimiento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @establecimiento
    assert_response :success
  end

  test "should update establecimiento" do
    put :update, id: @establecimiento, establecimiento: { calendario: @establecimiento.calendario, dane_establecimiento: @establecimiento.dane_establecimiento, direccion: @establecimiento.direccion, email: @establecimiento.email, id_municipio: @establecimiento.id_municipio, jornada: @establecimiento.jornada, localidad: @establecimiento.localidad, nombre: @establecimiento.nombre, telefono: @establecimiento.telefono, usuario: @establecimiento.usuario, zona: @establecimiento.zona }
    assert_redirected_to establecimiento_path(assigns(:establecimiento))
  end

  test "should destroy establecimiento" do
    assert_difference('Establecimientos.count', -1) do
      delete :destroy, id: @establecimiento
    end

    assert_redirected_to establecimientos_index_path
  end
end
