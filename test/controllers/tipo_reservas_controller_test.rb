require "test_helper"

class TipoReservasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_reserva = tipo_reservas(:one)
  end

  test "should get index" do
    get tipo_reservas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_reserva_url
    assert_response :success
  end

  test "should create tipo_reserva" do
    assert_difference('TipoReserva.count') do
      post tipo_reservas_url, params: { tipo_reserva: {  } }
    end

    assert_redirected_to tipo_reserva_url(TipoReserva.last)
  end

  test "should show tipo_reserva" do
    get tipo_reserva_url(@tipo_reserva)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_reserva_url(@tipo_reserva)
    assert_response :success
  end

  test "should update tipo_reserva" do
    patch tipo_reserva_url(@tipo_reserva), params: { tipo_reserva: {  } }
    assert_redirected_to tipo_reserva_url(@tipo_reserva)
  end

  test "should destroy tipo_reserva" do
    assert_difference('TipoReserva.count', -1) do
      delete tipo_reserva_url(@tipo_reserva)
    end

    assert_redirected_to tipo_reservas_url
  end
end
