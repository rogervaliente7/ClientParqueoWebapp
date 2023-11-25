require "application_system_test_case"

class TipoReservasTest < ApplicationSystemTestCase
  setup do
    @tipo_reserva = tipo_reservas(:one)
  end

  test "visiting the index" do
    visit tipo_reservas_url
    assert_selector "h1", text: "Tipo Reservas"
  end

  test "creating a Tipo reserva" do
    visit tipo_reservas_url
    click_on "New Tipo Reserva"

    click_on "Create Tipo reserva"

    assert_text "Tipo reserva was successfully created"
    click_on "Back"
  end

  test "updating a Tipo reserva" do
    visit tipo_reservas_url
    click_on "Edit", match: :first

    click_on "Update Tipo reserva"

    assert_text "Tipo reserva was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo reserva" do
    visit tipo_reservas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo reserva was successfully destroyed"
  end
end
