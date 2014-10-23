# -*- encoding : utf-8 -*-
require 'test_helper'

class ComponentesControllerTest < ActionController::TestCase
  setup do
    @componente = componentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:componentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create componente" do
    assert_difference('Componente.count') do
      post :create, componente: { disco_duro: @componente.disco_duro, display: @componente.display, equipo_id: @componente.equipo_id, fabricante: @componente.fabricante, memoria_ram: @componente.memoria_ram, modelo: @componente.modelo, nombre: @componente.nombre, procesador: @componente.procesador, serial: @componente.serial, sist_operativo: @componente.sist_operativo }
    end

    assert_redirected_to componente_path(assigns(:componente))
  end

  test "should show componente" do
    get :show, id: @componente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @componente
    assert_response :success
  end

  test "should update componente" do
    put :update, id: @componente, componente: { disco_duro: @componente.disco_duro, display: @componente.display, equipo_id: @componente.equipo_id, fabricante: @componente.fabricante, memoria_ram: @componente.memoria_ram, modelo: @componente.modelo, nombre: @componente.nombre, procesador: @componente.procesador, serial: @componente.serial, sist_operativo: @componente.sist_operativo }
    assert_redirected_to componente_path(assigns(:componente))
  end

  test "should destroy componente" do
    assert_difference('Componente.count', -1) do
      delete :destroy, id: @componente
    end

    assert_redirected_to componentes_path
  end
end
