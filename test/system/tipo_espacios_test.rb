require "application_system_test_case"

class TipoEspaciosTest < ApplicationSystemTestCase
  setup do
    @tipo_espacio = tipo_espacios(:one)
  end

  test "visiting the index" do
    visit tipo_espacios_url
    assert_selector "h1", text: "Tipo Espacios"
  end

  test "creating a Tipo espacio" do
    visit tipo_espacios_url
    click_on "New Tipo Espacio"

    click_on "Create Tipo espacio"

    assert_text "Tipo espacio was successfully created"
    click_on "Back"
  end

  test "updating a Tipo espacio" do
    visit tipo_espacios_url
    click_on "Edit", match: :first

    click_on "Update Tipo espacio"

    assert_text "Tipo espacio was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo espacio" do
    visit tipo_espacios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo espacio was successfully destroyed"
  end
end
