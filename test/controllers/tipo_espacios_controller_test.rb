require "test_helper"

class TipoEspaciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_espacio = tipo_espacios(:one)
  end

  test "should get index" do
    get tipo_espacios_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_espacio_url
    assert_response :success
  end

  test "should create tipo_espacio" do
    assert_difference('TipoEspacio.count') do
      post tipo_espacios_url, params: { tipo_espacio: {  } }
    end

    assert_redirected_to tipo_espacio_url(TipoEspacio.last)
  end

  test "should show tipo_espacio" do
    get tipo_espacio_url(@tipo_espacio)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_espacio_url(@tipo_espacio)
    assert_response :success
  end

  test "should update tipo_espacio" do
    patch tipo_espacio_url(@tipo_espacio), params: { tipo_espacio: {  } }
    assert_redirected_to tipo_espacio_url(@tipo_espacio)
  end

  test "should destroy tipo_espacio" do
    assert_difference('TipoEspacio.count', -1) do
      delete tipo_espacio_url(@tipo_espacio)
    end

    assert_redirected_to tipo_espacios_url
  end
end
