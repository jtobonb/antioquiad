require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { dane_sede: @equipment.dane_sede, disco_duro: @equipment.disco_duro, display: @equipment.display, fabricante: @equipment.fabricante, fecha_entrega: @equipment.fecha_entrega, memoria_ram: @equipment.memoria_ram, modelo: @equipment.modelo, nombre: @equipment.nombre, origen: @equipment.origen, procesador: @equipment.procesador, serial: @equipment.serial, sist_operativo: @equipment.sist_operativo, tipo: @equipment.tipo }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response :success
  end

  test "should update equipment" do
    put :update, id: @equipment, equipment: { dane_sede: @equipment.dane_sede, disco_duro: @equipment.disco_duro, display: @equipment.display, fabricante: @equipment.fabricante, fecha_entrega: @equipment.fecha_entrega, memoria_ram: @equipment.memoria_ram, modelo: @equipment.modelo, nombre: @equipment.nombre, origen: @equipment.origen, procesador: @equipment.procesador, serial: @equipment.serial, sist_operativo: @equipment.sist_operativo, tipo: @equipment.tipo }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end
