require 'test_helper'

class ComandosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comando = comandos(:one)
  end

  test "should get index" do
    get comandos_url
    assert_response :success
  end

  test "should get new" do
    get new_comando_url
    assert_response :success
  end

  test "should create comando" do
    assert_difference('Comando.count') do
      post comandos_url, params: { comando: { comando: @comando.comando, nome: @comando.nome } }
    end

    assert_redirected_to comando_url(Comando.last)
  end

  test "should show comando" do
    get comando_url(@comando)
    assert_response :success
  end

  test "should get edit" do
    get edit_comando_url(@comando)
    assert_response :success
  end

  test "should update comando" do
    patch comando_url(@comando), params: { comando: { comando: @comando.comando, nome: @comando.nome } }
    assert_redirected_to comando_url(@comando)
  end

  test "should destroy comando" do
    assert_difference('Comando.count', -1) do
      delete comando_url(@comando)
    end

    assert_redirected_to comandos_url
  end
end
