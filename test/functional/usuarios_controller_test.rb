# -*- encoding : utf-8 -*-
require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post :create, usuario: { cedula: @usuario.cedula, contraseña: @usuario.contraseña, correo: @usuario.correo, direccion: @usuario.direccion, genero: @usuario.genero, num_celular: @usuario.num_celular, primer_apellido: @usuario.primer_apellido, primer_nombre: @usuario.primer_nombre, segundo_apellido: @usuario.segundo_apellido, segundo_nombre: @usuario.segundo_nombre, telefono: @usuario.telefono, tipo_funcionario: @usuario.tipo_funcionario }
    end

    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should show usuario" do
    get :show, id: @usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario
    assert_response :success
  end

  test "should update usuario" do
    put :update, id: @usuario, usuario: { cedula: @usuario.cedula, contraseña: @usuario.contraseña, correo: @usuario.correo, direccion: @usuario.direccion, genero: @usuario.genero, num_celular: @usuario.num_celular, primer_apellido: @usuario.primer_apellido, primer_nombre: @usuario.primer_nombre, segundo_apellido: @usuario.segundo_apellido, segundo_nombre: @usuario.segundo_nombre, telefono: @usuario.telefono, tipo_funcionario: @usuario.tipo_funcionario }
    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete :destroy, id: @usuario
    end

    assert_redirected_to usuarios_path
  end
end
