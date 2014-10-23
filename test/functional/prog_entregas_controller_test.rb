# -*- encoding : utf-8 -*-
require 'test_helper'

class ProgEntregasControllerTest < ActionController::TestCase
  setup do
    @prog_entrega = prog_entregas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prog_entregas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prog_entrega" do
    assert_difference('ProgEntrega.count') do
      post :create, prog_entrega: { cantidad: @prog_entrega.cantidad, cod_programa: @prog_entrega.cod_programa, entidad_ejecutora: @prog_entrega.entidad_ejecutora, fase: @prog_entrega.fase, fecha_entrega: @prog_entrega.fecha_entrega, nombre_programa: @prog_entrega.nombre_programa, responsable: @prog_entrega.responsable }
    end

    assert_redirected_to prog_entrega_path(assigns(:prog_entrega))
  end

  test "should show prog_entrega" do
    get :show, id: @prog_entrega
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prog_entrega
    assert_response :success
  end

  test "should update prog_entrega" do
    put :update, id: @prog_entrega, prog_entrega: { cantidad: @prog_entrega.cantidad, cod_programa: @prog_entrega.cod_programa, entidad_ejecutora: @prog_entrega.entidad_ejecutora, fase: @prog_entrega.fase, fecha_entrega: @prog_entrega.fecha_entrega, nombre_programa: @prog_entrega.nombre_programa, responsable: @prog_entrega.responsable }
    assert_redirected_to prog_entrega_path(assigns(:prog_entrega))
  end

  test "should destroy prog_entrega" do
    assert_difference('ProgEntrega.count', -1) do
      delete :destroy, id: @prog_entrega
    end

    assert_redirected_to prog_entregas_path
  end
end
